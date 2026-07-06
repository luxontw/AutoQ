"""Lower mqt-bench circuits into AutoQ `ex` all-basis benchmarks.

This is the shared engine behind the ``*all`` benchmark families that are
derived from `mqt-bench <https://www.cda.cit.tum.de/mqtbench/>`_ (DJall,
Qwalkall, Graphstateall, the adders, and the multipliers). Every family's
``produce.py`` is a thin wrapper that calls :func:`generate` here; this module
holds the one copy of the mqt-load / gate-lowering / QASM-emission / pre.hsl
logic so the families stay byte-for-byte consistent.

What "all-basis" means here (clean-ancilla convention): each benchmark
directory holds a ``circuit.qasm`` plus a ``pre.hsl`` whose Extended-Dirac set
sweeps *every* computational basis state of the circuit's INPUT qubits while
pinning every ancilla to |0> (e.g. ``{ |i000> : |i|=8 }``). Ancilla means (a)
the v-chain ancilla :func:`_emit_lines` appends for ``mcx`` lowering, (b) any
Qiskit ``AncillaRegister`` qubits (the arithmetic builders' ``help``/``helper``),
and (c) registers listed in :data:`_ZERO_INIT_REGS` whose semantics require
|0> initialization (the multipliers' ``out`` accumulator, whose XOR carry-out
trick is only correct when the accumulator starts empty). Sweeping ancilla
would (1) feed inputs on which the lowered circuit does NOT implement the
documented function — the v-chain equals C^kX only on the ancilla-|0> subspace
— and (2) blow up AutoQ's output automaton with semantically meaningless
states (measured: Qwalkall AutoQ ex went from timeout at N=11 full-basis to
3.4 s at N=16 clean-ancilla). Families without ancilla keep the plain
``{ |i> : |i|=q }`` set. It is meant for AutoQ's ``ex`` subcommand
(pure-unitary simulation over the whole input set at once), so no ``post.hsl``
is produced.

AutoQ's QASM parser (see ``src/execute.cc`` dispatch table) understands only
``{h, x, y, z, s, sdg, t, tdg, cx, cz, ck, ccx, swap}`` plus ``rx/rz/ry``. It has
no ``mcx``/``p``/``cp``/``u`` and its amplitude ring is the 8th roots of unity
(ω = e^{iπ/4}). The families produced here are deliberately *phase-free*
Clifford+Toffoli circuits — gate set ``{h, x, z, cx, cz, ccx}`` — so:

  * Circuits whose mqt-bench default synthesis is already phase-free (dj, qwalk,
    graphstate, the ripple adders, half/full adder) are loaded from mqt-bench and
    lowered directly. Any multi-controlled ``mcx`` (e.g. qwalk, or half_adder at
    n>=9) is realized as a clean-ancilla Toffoli v-chain — the same pure-{ccx,cx}
    construction GroverAll uses.
  * Circuits whose mqt-bench default synthesis carries π/2^k phases
    (``modular_adder`` is relative-phase, ``multiplier`` / ``hrs_cumulative_multiplier``
    are QFT-based) are NOT loaded from mqt-bench. They are rebuilt here as
    *functionally equivalent* pure-Toffoli ripple-carry circuits
    (:func:`build_modular_adder`, :func:`build_cumulative_multiplier`). These
    compute the same arithmetic (add / multiply mod 2^n) but are not the exact
    mqt-bench circuit — the approved trade-off for staying inside AutoQ's ring.

:func:`lower_to_autoq` guards this invariant: if a circuit cannot be reduced to
``{AutoQ leaves} ∪ {mcx}`` it raises rather than emitting silently-wrong QASM.
"""
from __future__ import annotations

from typing import Callable, Iterable

from common import ensure_bench_dir_for_n, write_hsl, write_qasm_header

# --- AutoQ's real gate set (from src/execute.cc:277-338) -------------------
# Leaves we emit verbatim. `mcx` is NOT here: it is lowered via ckx_vchain.
AUTOQ_LEAVES = frozenset(
    {"h", "x", "y", "z", "s", "sdg", "t", "tdg", "cx", "cz", "ccx", "swap"}
)
# What lower_to_autoq is allowed to stop at (leaves + the one gate we expand).
_LOWER_TARGET = AUTOQ_LEAVES | {"mcx"}
_DROP = frozenset({"measure", "barrier"})
# Phase / universal-rotation gates that would break the phase-free invariant if
# they survive lowering. Presence of any of these at fixpoint is a hard error.
_PHASE_MARKERS = frozenset(
    {"p", "cp", "crz", "cu1", "mcphase", "rz", "rx", "ry", "u", "u1", "u2", "u3", "rccx"}
)


# ---------------------------------------------------------------------------
# Multi-controlled X -> clean-ancilla Toffoli v-chain (pure {ccx, cx}).
# ---------------------------------------------------------------------------
def ckx_vchain(controls: list[int], target: int, anc: list[int]) -> list[str]:
    """QASM lines for C^kX using clean ancilla, pure ``{ccx, cx}``.

    ``controls`` are control-qubit indices, ``target`` the target, and ``anc`` a
    pool of at least ``max(k-2, 0)`` clean-|0> ancilla indices. Ancilla are
    computed up then uncomputed down, so they return to |0>. Verified equal to
    Qiskit's ``MCXGate`` on the ancilla-|0> subspace for k = 1..6.
    """
    k = len(controls)
    if k == 0:
        return [f"x qubits[{target}];\n"]
    if k == 1:
        return [f"cx qubits[{controls[0]}], qubits[{target}];\n"]
    if k == 2:
        return [f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{target}];\n"]
    a = anc[: k - 2]
    lines = [f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{a[0]}];\n"]
    for i in range(2, k - 1):
        lines.append(f"ccx qubits[{controls[i]}], qubits[{a[i-2]}], qubits[{a[i-1]}];\n")
    lines.append(f"ccx qubits[{controls[k-1]}], qubits[{a[k-3]}], qubits[{target}];\n")
    for i in reversed(range(2, k - 1)):
        lines.append(f"ccx qubits[{controls[i]}], qubits[{a[i-2]}], qubits[{a[i-1]}];\n")
    lines.append(f"ccx qubits[{controls[0]}], qubits[{controls[1]}], qubits[{a[0]}];\n")
    return lines


# ---------------------------------------------------------------------------
# Selective decomposition down to AutoQ's gate set (+ mcx).
# ---------------------------------------------------------------------------
def _ops(qc) -> set[str]:
    return {ci.operation.name for ci in qc.data} - _DROP


def lower_to_autoq(qc, name: str, max_depth: int = 24):
    """Decompose ``qc`` until its gate set ⊆ ``AUTOQ_LEAVES ∪ {mcx}``.

    Returns the lowered ``QuantumCircuit``. Raises ``ValueError`` if a fixpoint
    is reached with residual gates AutoQ cannot handle (phase/rotation gates) —
    the guard that keeps the phase-free families honest.

    Only the *non-target* gate names are expanded at each step
    (``gates_to_decompose=``): a blind ``.decompose()`` would also rewrite valid
    leaves like ``h`` into ``u`` and trip the phase guard.
    """
    prev = None
    for _ in range(max_depth):
        ops = _ops(qc)
        if ops <= _LOWER_TARGET:
            return qc
        if ops == prev:
            break
        prev = ops
        todo = [g for g in ops if g not in _LOWER_TARGET]
        qc = qc.decompose(gates_to_decompose=todo)
    residual = sorted(_ops(qc) - _LOWER_TARGET)
    phases = sorted(_ops(qc) & _PHASE_MARKERS)
    raise ValueError(
        f"{name}: cannot lower to AutoQ gate set; residual={residual}"
        + (f" (phase/rotation gates {phases} are outside AutoQ's e^(i*pi/4) ring)" if phases else "")
    )


# ---------------------------------------------------------------------------
# QASM emission (drops measure/barrier, expands mcx via the v-chain).
# ---------------------------------------------------------------------------
def _emit_lines(qc) -> tuple[list[str], int]:
    """Return ``(qasm_body_lines, total_qubits)`` for a lowered circuit.

    ``total_qubits`` = circuit qubits + ancilla the v-chain needs for the widest
    ``mcx``. The ancilla occupy the high indices ``[num_qubits, total)``.
    """
    idx = {q: i for i, q in enumerate(qc.qubits)}
    max_ctrl = 0
    for ci in qc.data:
        if ci.operation.name == "mcx":
            max_ctrl = max(max_ctrl, len(ci.qubits) - 1)
    n_anc = max(max_ctrl - 2, 0)
    q = qc.num_qubits + n_anc
    anc = list(range(qc.num_qubits, q))

    lines: list[str] = []
    for ci in qc.data:
        name = ci.operation.name
        if name in _DROP:
            continue
        w = [idx[b] for b in ci.qubits]
        if name in ("h", "x", "y", "z", "s", "sdg", "t", "tdg"):
            lines.append(f"{name} qubits[{w[0]}];\n")
        elif name in ("cx", "cz", "swap"):
            lines.append(f"{name} qubits[{w[0]}], qubits[{w[1]}];\n")
        elif name == "ccx":
            lines.append(f"ccx qubits[{w[0]}], qubits[{w[1]}], qubits[{w[2]}];\n")
        elif name == "mcx":
            lines.extend(ckx_vchain(w[:-1], w[-1], anc))
        else:
            raise ValueError(f"unsupported gate {name!r} after lowering")
    return lines, q


# Variable letters for free ket segments. 'o' and 'l' are skipped (they read
# as 0/1 in a bitstring context); AutoQ variables are single letters.
_KET_VARS = "ijkmnpqrstuvw"


def write_clean_ancilla_pre_hsl(path: str, q: int, fixed_zero: Iterable[int]) -> None:
    """Write the clean-ancilla input-set precondition for a ``q``-qubit circuit.

    ``fixed_zero`` are the qubit indices pinned to literal ``0`` (the ancilla);
    every other position is a free bit. Consecutive free positions are grouped
    into one variable, e.g. q=5 with ``fixed_zero={2, 3}`` gives
    ``{ |i00j> : |i|=2, |j|=1 }`` (MCToffoli-style). With no ancilla this is the
    plain all-basis set ``{ |i> : |i|=q }``.
    """
    fixed = set(fixed_zero)
    if not fixed <= set(range(q)):
        raise ValueError(f"fixed_zero {sorted(fixed)} out of range for q={q}")
    ket_parts: list[str] = []
    constraints: list[str] = []
    run = 0
    def flush_run():
        nonlocal run
        if run:
            if len(constraints) >= len(_KET_VARS):
                raise ValueError(f"too many free segments for q={q}")
            v = _KET_VARS[len(constraints)]
            ket_parts.append(v)
            constraints.append(f"|{v}|={run}")
            run = 0
    for p in range(q):
        if p in fixed:
            flush_run()
            ket_parts.append("0")
        else:
            run += 1
    flush_run()
    body = f"{{ |{''.join(ket_parts)}> : {', '.join(constraints)} }}\n"
    write_hsl(path, body, header="Extended Dirac\n")


# ---------------------------------------------------------------------------
# mqt-bench loaders (lazy — importing mqt.bench is only needed at generation).
# ---------------------------------------------------------------------------
# ``graphstate`` builds a *random* regular graph seeded from an unseeded global
# RNG, so two fresh processes emit different graphs. We pin a fixed seed for any
# benchmark that accepts one, so (a) circuit.qasm and mqt_bench.qasm always
# describe the SAME graph, and (b) regeneration is reproducible. Benchmarks that
# take no ``seed`` kwarg are unaffected (all deterministic already).
_FIXED_SEED = 42
_SEEDED_BENCHMARKS = frozenset({"graphstate"})


def _mqt_get(name: str, num_qubits: int):
    """Load ``name`` from mqt-bench at ALG level, pinning the seed when relevant."""
    from mqt.bench import BenchmarkLevel, get_benchmark

    if name in _SEEDED_BENCHMARKS:
        return get_benchmark(name, BenchmarkLevel.ALG, num_qubits, seed=_FIXED_SEED)
    return get_benchmark(name, BenchmarkLevel.ALG, num_qubits)


def _mqt_source(name: str) -> Callable[[int], object]:
    """Return a builder ``n -> QuantumCircuit`` that loads ``name`` from mqt-bench."""

    def build(n: int):
        return _mqt_get(name, n)

    return build


# ---------------------------------------------------------------------------
# Pure-Toffoli replacements for the three phase-carrying arithmetic circuits.
# ---------------------------------------------------------------------------
def build_modular_adder(n: int):
    """Adder mod 2^n on two n-bit registers, pure ``{ccx, cx}``.

    This is ``adder_ripple_c04(n, kind='fixed')``: |a>|b> -> |a>|(a+b) mod 2^n>
    with one ``help`` ancilla. Replaces mqt-bench's relative-phase ModularAdder.
    Layout: qubits [a(n) | b(n) | help(1)].
    """
    from qiskit.synthesis import adder_ripple_c04

    return adder_ripple_c04(n, kind="fixed")


def _gate_level_control(add):
    """Add one control to a pure-Toffoli circuit at the gate level.

    x -> cx, cx -> ccx, ccx -> mcx (C^3X). The new control is appended as the
    highest-index qubit. Keeps the result phase-free (no Qiskit ``.control()``
    phase-gate synthesis). Verified equal to the ideal controlled operation.
    """
    from qiskit import QuantumCircuit

    na = add.num_qubits
    c = na
    out = QuantumCircuit(na + 1)
    idx = {q: i for i, q in enumerate(add.qubits)}
    for ci in add.data:
        nm = ci.operation.name
        w = [idx[b] for b in ci.qubits]
        if nm == "x":
            out.cx(c, w[0])
        elif nm == "cx":
            out.ccx(c, w[0], w[1])
        elif nm == "ccx":
            out.mcx([c, w[0], w[1]], w[2])
        else:
            raise ValueError(f"_gate_level_control: unexpected gate {nm!r}")
    return out


def build_cumulative_multiplier(n: int):
    """Schoolbook multiplier |a>|b>|0(2n)> -> |a>|b>|a*b>, pure Toffoli.

    For each bit ``a[i]`` we controlled-add ``b`` (shifted by i) into the 2n-bit
    output accumulator using a clean-ancilla ripple half-adder, controlling at
    the gate level (so any C^kX becomes an ``mcx`` that :func:`emit_qasm` lowers
    via the v-chain). Verified to compute a*b on every input with ancilla left
    clean. Replaces both mqt-bench's QFT ``multiplier`` and the QFT-phase
    ``hrs_cumulative_multiplier`` (HRS is the cumulative-multiplier scheme).
    """
    from qiskit import AncillaRegister, QuantumCircuit, QuantumRegister
    from qiskit.synthesis import adder_ripple_c04

    a = QuantumRegister(n, "a")
    b = QuantumRegister(n, "b")
    out = QuantumRegister(2 * n, "out")
    add = adder_ripple_c04(n, kind="half").decompose()  # layout: [a(n) b(n) cout(1) help(k)]
    n_help = add.num_qubits - (2 * n + 1)
    help_ = AncillaRegister(n_help, "help") if n_help else None
    qc = QuantumCircuit(*([a, b, out] + ([help_] if help_ else [])))
    cadd = _gate_level_control(add).to_instruction()
    for i in range(n):
        a_map = [b[j] for j in range(n)]          # addend  <- b (unchanged)
        b_map = [out[i + j] for j in range(n)]    # accumulator window
        cout = [out[i + n]]                        # carry-out
        h_map = [help_[j] for j in range(n_help)] if help_ else []
        qc.append(cadd, a_map + b_map + cout + h_map + [a[i]])
    return qc


# ---------------------------------------------------------------------------
# Valid size rules per benchmark (from mqt-bench's own constraints) and the
# size-selection helper the wrappers call.
# ---------------------------------------------------------------------------
def _sizes_dj(lo, hi):
    return [n for n in range(max(lo, 1), hi + 1)]


def _sizes_qwalk(lo, hi):
    return [n for n in range(max(lo, 3), hi + 1)]


def _sizes_graphstate(lo, hi):
    return [n for n in range(max(lo, 3), hi + 1)]


def _sizes_even_ge4(lo, hi):  # cdkm, full_adder
    return [n for n in range(max(lo, 4), hi + 1) if n % 2 == 0]


def _sizes_vbe(lo, hi):  # n>=4 and (n-1) % 3 == 0
    return [n for n in range(max(lo, 4), hi + 1) if (n - 1) % 3 == 0]


def _sizes_odd_ge3(lo, hi):  # half_adder
    return [n for n in range(max(lo, 3), hi + 1) if n % 2 == 1]


# Replacement circuits are parameterized by state-qubit count n; the emitted
# qreg width q grows with n. We cap by q so the q-qubit circuits (and the
# DDSIM per-basis / unitary sweeps over them) stay tractable; the clean-ancilla
# input sets are smaller still (2^(2n) for the adders/multipliers).
# ModularAdderall and HRSMultiplierall were later extended by 5 sizes past the
# original ~20-qubit cap (n<=14 -> q=29, n<=9 -> q=38); Multiplierall keeps it.
_MODULAR_MAX_Q = 29
_MULT_MAX_Q = 20
_HRS_MAX_Q = 38


def _sizes_modular(lo, hi):
    # q = 2n + 1 (a, b, help). Cap at _MODULAR_MAX_Q.
    return [n for n in range(max(lo, 2), hi + 1) if 2 * n + 1 <= _MODULAR_MAX_Q]


def _sizes_multiplier(lo, hi):
    # emitted q = base(4n+1) + vchain_anc(1) = 4n + 2. Cap at _MULT_MAX_Q.
    return [n for n in range(max(lo, 2), hi + 1) if 4 * n + 2 <= _MULT_MAX_Q]


def _sizes_hrs(lo, hi):
    # Same emitted q = 4n + 2 as _sizes_multiplier, HRSMultiplierall's cap.
    return [n for n in range(max(lo, 2), hi + 1) if 4 * n + 2 <= _HRS_MAX_Q]


# Registers (by name) that must start in |0> for the circuit to compute its
# documented function, beyond what Qiskit's AncillaRegister already marks.
# The multipliers' ``out`` accumulator uses the c04 half-adder's XOR carry-out,
# which only accumulates correctly when the window's top bit is still 0 — true
# for out=|0...0>, false for arbitrary initial contents. The pre.hsl therefore
# pins it to 0 alongside the ancilla (input sweep = a, b only, matching
# |a>|b>|0> -> |a>|b>|a*b>). CDKM/VBE ``cout`` is deliberately NOT here: its
# XOR semantics (cout_final = cout_init XOR carry) are exact on every input.
_ZERO_INIT_REGS: dict[str, frozenset[str]] = {
    "multiplier": frozenset({"out"}),
    "hrs_cumulative_multiplier": frozenset({"out"}),
}

# name -> (size_fn, source_builder-or-None). None source means load from mqt-bench.
_REGISTRY: dict[str, tuple[Callable[[int, int], list[int]], Callable[[int], object] | None]] = {
    "dj": (_sizes_dj, None),
    "qwalk": (_sizes_qwalk, None),
    "graphstate": (_sizes_graphstate, None),
    "cdkm_ripple_carry_adder": (_sizes_even_ge4, None),
    "vbe_ripple_carry_adder": (_sizes_vbe, None),
    "full_adder": (_sizes_even_ge4, None),
    "half_adder": (_sizes_odd_ge3, None),
    "modular_adder": (_sizes_modular, build_modular_adder),
    "multiplier": (_sizes_multiplier, build_cumulative_multiplier),
    "hrs_cumulative_multiplier": (_sizes_hrs, build_cumulative_multiplier),
}


def sizes_for(name: str, lo: int = 1, hi: int = 20) -> list[int]:
    """Valid benchmark sizes for ``name`` within ``[lo, hi]`` (inclusive)."""
    if name not in _REGISTRY:
        raise KeyError(f"unknown benchmark {name!r}; known: {sorted(_REGISTRY)}")
    return _REGISTRY[name][0](lo, hi)


# Map a benchmark dir number ``k`` to the ``num_qubits`` argument mqt-bench wants.
# For the mqt-loaded families the dir number already IS mqt's num_qubits. For the
# arithmetic replacements the dir number is the state-qubit count n, and mqt's
# own gate takes a larger total: ModularAdder 2n, Multiplier 4n, HRS 4n+1.
_MQT_NUM_QUBITS: dict[str, Callable[[int], int]] = {
    "dj": lambda k: k,
    "qwalk": lambda k: k,
    "graphstate": lambda k: k,
    "cdkm_ripple_carry_adder": lambda k: k,
    "vbe_ripple_carry_adder": lambda k: k,
    "full_adder": lambda k: k,
    "half_adder": lambda k: k,
    "modular_adder": lambda k: 2 * k,
    "multiplier": lambda k: 4 * k,
    "hrs_cumulative_multiplier": lambda k: 4 * k + 1,
}


def dump_mqt_bench(name: str, sizes: Iterable[int] | None = None, *, zfill: int = 2) -> None:
    """Write the raw, unmodified mqt-bench circuit as ``<size>/mqt_bench.qasm``.

    Run from within a family directory (like the family's ``produce.py``). This is
    a faithful OPENQASM 2.0 reference of exactly what mqt-bench emits at the ALG
    level — custom gate wrappers, measurements, barriers, and, for the modular
    adder / multipliers, the QFT / relative-phase gates that ``circuit.qasm``
    deliberately replaces with a phase-free pure-Toffoli equivalent.

    It is NOT lowered to AutoQ's gate set and NOT read by ``ex`` (AutoQ ignores
    the phase gates it cannot parse); it is provided purely for cross-checking the
    phase-free ``circuit.qasm`` against the original (e.g. with mqt.qcec, whose
    ancilla/garbage annotations are recoverable from the measurements kept here).

    The dir number is the same parameter the family's ``circuit.qasm`` uses; the
    mqt-bench ``num_qubits`` argument is derived via :data:`_MQT_NUM_QUBITS`.
    """
    from qiskit import qasm2

    if name not in _MQT_NUM_QUBITS:
        raise KeyError(f"unknown benchmark {name!r}; known: {sorted(_MQT_NUM_QUBITS)}")
    if sizes is None:
        sizes = _REGISTRY[name][0](1, 20)
    nqf = _MQT_NUM_QUBITS[name]
    for k in sizes:
        nq = nqf(k)
        qc = _mqt_get(name, nq)
        n_str = ensure_bench_dir_for_n(k, zfill=zfill)
        qasm2.dump(qc, n_str + "/mqt_bench.qasm")
        print(f"  {name} size={k:>2} -> {n_str}/mqt_bench.qasm  (mqt num_qubits={nq})")


# ---------------------------------------------------------------------------
# Orchestrator.
# ---------------------------------------------------------------------------
def generate(name: str, sizes: Iterable[int] | None = None, *, zfill: int = 2) -> None:
    """Generate ``<size>/circuit.qasm`` + ``<size>/pre.hsl`` for each size.

    Run from within a family directory (like the other ``produce.py`` scripts).
    ``sizes`` defaults to :func:`sizes_for` over 1..20. Circuits are loaded from
    mqt-bench, or from the pure-Toffoli builder registered for the phase-carrying
    families, then lowered to AutoQ's gate set and emitted with a clean-ancilla
    input-set ``pre.hsl`` (all basis states over the input qubits, ancilla and
    :data:`_ZERO_INIT_REGS` registers pinned to |0>; see the module docstring).
    No ``post.hsl`` (``ex``-only, as with GroverAll/BVall).
    """
    if name not in _REGISTRY:
        raise KeyError(f"unknown benchmark {name!r}; known: {sorted(_REGISTRY)}")
    size_fn, builder = _REGISTRY[name]
    if sizes is None:
        sizes = size_fn(1, 20)
    if builder is None:
        builder = _mqt_source(name)

    for n in sizes:
        qc = builder(n)
        # Pin to |0>: Qiskit-tracked ancilla plus any must-start-at-zero
        # registers. Indices are stable across decompose(), so they can be
        # collected on the pre-lowering circuit where register names live.
        fixed_zero = {qc.find_bit(b).index for b in qc.ancillas}
        for reg in qc.qregs:
            if reg.name in _ZERO_INIT_REGS.get(name, frozenset()):
                fixed_zero |= {qc.find_bit(b).index for b in reg}
        lowered = lower_to_autoq(qc, f"{name}({n})")
        body, q = _emit_lines(lowered)
        # The v-chain ancilla _emit_lines appends occupy the high indices.
        fixed_zero |= set(range(lowered.num_qubits, q))

        n_str = ensure_bench_dir_for_n(n, zfill=zfill)
        write_clean_ancilla_pre_hsl(n_str + "/pre.hsl", q, fixed_zero)
        with open(n_str + "/circuit.qasm", "w") as file:
            write_qasm_header(file)
            file.write(f"qreg qubits[{q}];\n\n")
            for line in body:
                file.write(line)
        print(f"  {name} size={n:>2} -> {n_str}/  (qreg={q}, "
              f"inputs=2^{q - len(fixed_zero)}, ancilla={len(fixed_zero)})")
