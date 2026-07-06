#!/usr/bin/python3
"""Check `circuit.qasm` (phase-free, AutoQ) == `mqt_bench.qasm` (raw mqt-bench)
with mqt.qcec, family by family.

Why a dedicated script: the two QASM files in each benchmark folder are NOT the
same unitary on the full Hilbert space — `circuit.qasm` adds clean ancilla (for
the Toffoli v-chains) and, for the three arithmetic families, is a pure-Toffoli
*replacement* of an mqt-bench circuit that used QFT/relative-phase gates. They
are equal only on the circuits' intended input/output subspace. QCEC can prove
exactly that, but only once told which qubits are:

  * ancillary  — guaranteed |0> on input (so QCEC ignores non-|0> input columns),
  * garbage    — output is don't-care (so QCEC ignores those output rows).

That information is lost in plain OPENQASM 2.0 (the `// i,// o` comments only
record permutations, and `ancillary` cannot be expressed at all), so we set it
programmatically here from each family's known register layout — it cannot live
in the shared `circuit.qasm`, which AutoQ consumes verbatim.

qcec lives in a different venv than mqt.bench (this script needs only qcec +
mqt.core + qiskit, i.e. the `q_bench/.venv`), so run it with THAT interpreter:

    ../../../q_bench/.venv/bin/python verify_equivalence.py                # all
    ../../../q_bench/.venv/bin/python verify_equivalence.py ModularAdderall  # one family
    ../../../q_bench/.venv/bin/python verify_equivalence.py Multiplierall/02 # one case

Exit code is nonzero if any case is not `equivalent`.
"""
from __future__ import annotations

import sys
from pathlib import Path

from mqt.core.ir import QuantumComputation
from mqt.qcec import verify

HERE = Path(__file__).resolve().parent

# The ZX checker aborts (SIGABRT) when the two circuits differ in qubit count,
# which is the norm here (circuit.qasm carries extra ancilla). Disable it; the
# construction + simulation checkers handle partial equivalence fine.
_VERIFY_KW = dict(check_partial_equivalence=True, run_zx_checker=False)


# --- Per-family annotation specs -------------------------------------------
# Each spec, given the folder number k, returns (mqt_ann, circ_ann) where each
# is a dict with:
#   "ancilla":  qubit indices guaranteed |0> on input,
#   "garbage":  qubit indices whose output is don't-care.
# A pure ancilla scratch qubit (|0> in, restored to |0>, never read) is BOTH.
# Qubits absent from both lists are genuine logical inputs/outputs.
#
# For the mqt-loaded families (dj, qwalk, graphstate, cdkm, vbe, full, half),
# circuit.qasm shares the mqt logical qubits at the SAME low indices; its only
# extra qubits are v-chain ancilla appended at the high indices — mark those
# ancilla+garbage on the circuit side, nothing on the mqt side.
#
# For the arithmetic replacements (modular, multiplier, hrs) the result lives in
# a register that is |0> on input (ancillary) but IS read (not garbage); every
# helper/scratch qubit is ancilla+garbage on whichever circuit has it.


def _high_ancilla_only(mqt: QuantumComputation, circ: QuantumComputation):
    """Extra high-index qubits of circuit.qasm are clean scratch (anc+garbage)."""
    extra = circ.num_qubits - mqt.num_qubits
    circ_anc = list(range(circ.num_qubits - extra, circ.num_qubits))
    return {"ancilla": [], "garbage": []}, {"ancilla": circ_anc, "garbage": circ_anc}


def _dj_spec(k, mqt, circ):
    # Deutsch-Jozsa on n=k qubits uses n+1 qubits; qubit n is the phase-kickback
    # ancilla, prepared |1> and NEVER measured -> garbage on BOTH circuits (and
    # ancillary: its logical input is fixed, not a free input we sweep).
    anc = circ.num_qubits - 1  # == mqt.num_qubits - 1
    ann = {"ancilla": [anc], "garbage": [anc]}
    return ann, ann


def _modular_spec(k, mqt, circ):
    # modular_adder(n=k): circuit [a(n) b(n) help(1)]; result in b; help is scratch.
    # mqt modular_adder(2n): [a(n) b(n)], no exposed helper.
    nc = circ.num_qubits  # 2n+1
    return ({"ancilla": [], "garbage": []},
            {"ancilla": [nc - 1], "garbage": [nc - 1]})


def _mult_spec(k, mqt, circ):
    # multiplier / hrs: result register out = [2n, 4n) is |0> in (ancillary, read).
    # Everything at/after 4n on the circuit, and any helper on the mqt side, is
    # clean scratch (anc+garbage). k is the state-qubit count n.
    n = k
    out = list(range(2 * n, 4 * n))
    mqt_scratch = list(range(4 * n, mqt.num_qubits))       # mqt helper qubits, if any
    circ_scratch = list(range(4 * n, circ.num_qubits))     # cout/help + v-chain ancilla
    return ({"ancilla": out + mqt_scratch, "garbage": mqt_scratch},
            {"ancilla": out + circ_scratch, "garbage": circ_scratch})


# family dir -> spec function (or None to use the generic high-ancilla rule)
_SPECS = {
    "DJall": _dj_spec,
    "Qwalkall": None,
    "Graphstateall": None,
    "CDKMAdderall": None,
    "VBEAdderall": None,
    "FullAdderall": None,
    "HalfAdderall": None,
    "ModularAdderall": _modular_spec,
    "Multiplierall": _mult_spec,
    "HRSMultiplierall": _mult_spec,
}


def _apply(qc: QuantumComputation, ann: dict) -> None:
    for q in ann.get("ancilla", []):
        qc.set_circuit_qubit_ancillary(q)
    for q in ann.get("garbage", []):
        qc.set_circuit_qubit_garbage(q)


def verify_case(family: str, folder: str) -> str:
    """Return the EquivalenceCriterion name for one <family>/<folder> case."""
    d = HERE / family / folder
    circ = QuantumComputation.from_qasm(str(d / "circuit.qasm"))
    mqt = QuantumComputation.from_qasm(str(d / "mqt_bench.qasm"))

    spec = _SPECS[family]
    if spec is None:
        mqt_ann, circ_ann = _high_ancilla_only(mqt, circ)
    else:
        mqt_ann, circ_ann = spec(int(folder), mqt, circ)
    _apply(mqt, mqt_ann)
    _apply(circ, circ_ann)

    res = verify(mqt, circ, **_VERIFY_KW)
    return str(res.equivalence).split(".")[-1]


def _folders(family: str) -> list[str]:
    fam_dir = HERE / family
    return sorted(
        p.name for p in fam_dir.iterdir()
        if p.is_dir() and p.name.isdigit()
        and (p / "circuit.qasm").exists() and (p / "mqt_bench.qasm").exists()
    )


def main(argv: list[str]) -> int:
    targets: list[tuple[str, str]] = []
    if len(argv) <= 1:
        families = list(_SPECS)
    else:
        families = []
        for arg in argv[1:]:
            if "/" in arg:
                fam, fld = arg.split("/", 1)
                targets.append((fam, fld))
            else:
                families.append(arg)
    for fam in families:
        if fam not in _SPECS:
            print(f"[skip] unknown family {fam!r}")
            continue
        for fld in _folders(fam):
            targets.append((fam, fld))

    bad = 0
    for fam, fld in targets:
        try:
            verdict = verify_case(fam, fld)
        except Exception as e:  # noqa: BLE001 — report and continue
            verdict = f"ERROR {type(e).__name__}: {str(e)[:80]}"
        ok = verdict == "equivalent"
        bad += not ok
        mark = "OK " if ok else "!! "
        print(f"{mark}{fam}/{fld}: {verdict}")

    print(f"\n{len(targets)-bad}/{len(targets)} equivalent"
          + (f"  ({bad} NOT equivalent / errored)" if bad else ""))
    return 1 if bad else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
