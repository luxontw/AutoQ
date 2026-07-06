#!/usr/bin/python3
"""Adversarial checks that the ancilla/garbage annotations in
``verify_equivalence.py`` are neither too tight nor superfluous.

A plain `verify` returning ``equivalent`` only proves the annotations are not too
*loose* (it would report ``not_equivalent`` if too little were marked). It does
NOT prove they are not too *tight*: marking a result-carrying qubit ``garbage``
makes QCEC ignore that output, so a genuinely different circuit can still pass.
This script pins down the other direction, reusing ``verify_equivalence.py``'s
OWN spec logic (imported, not reimplemented):

  2a  garbage / output direction (fault injection): append an X to each circuit
      qubit and re-verify.
        * qubit IN the circuit garbage set  -> fault SHOULD be swallowed
          (``equivalent``); it is genuinely don't-care.
        * qubit NOT in the garbage set        -> fault MUST be caught
          (``not_equivalent``); its output is really compared.
      A checked qubit whose fault is swallowed would mean garbage is over-marked.

  2b  ancilla / input direction (ablation): drop the ancillary annotation (keep
      garbage) and re-verify. If the verdict flips to ``not_equivalent`` the
      |0>-input assumption is load-bearing (and correctly placed); if it stays
      ``equivalent`` the mark is conservative-but-harmless. Either way, an
      annotation that FLIPPED a real difference into ``equivalent`` would be
      caught by 2a, not here.

Run with the qcec interpreter (same venv as ``verify_equivalence.py``):

    ../../../q_bench/.venv/bin/python verify_annotations.py            # all families
    ../../../q_bench/.venv/bin/python verify_annotations.py Multiplierall  # one family

Exit code is nonzero if any 2a anomaly is found (a checked qubit's fault hidden,
or a garbage qubit's fault unexpectedly caught).
"""
from __future__ import annotations

import sys

from mqt.core.ir import QuantumComputation
from mqt.qcec import verify

import verify_equivalence as V

_KW = V._VERIFY_KW

# One representative folder per family (middle-ish size: big enough to exercise
# the marks, small enough for QCEC to finish quickly). Falls back to the first
# available folder if the preferred one is absent.
_PREFERRED = {
    "DJall": "05",
    "Qwalkall": "05",
    "Graphstateall": "05",
    "CDKMAdderall": "06",
    "VBEAdderall": "07",
    "FullAdderall": "06",
    "HalfAdderall": "09",
    "ModularAdderall": "03",
    "Multiplierall": "02",
    "HRSMultiplierall": "02",
}


def _load(fam: str, fld: str):
    """(circ, mqt, mqt_ann, circ_ann) using the script's real spec logic."""
    d = V.HERE / fam / fld
    circ = QuantumComputation.from_qasm(str(d / "circuit.qasm"))
    mqt = QuantumComputation.from_qasm(str(d / "mqt_bench.qasm"))
    spec = V._SPECS[fam]
    if spec is None:
        m_ann, c_ann = V._high_ancilla_only(mqt, circ)
    else:
        m_ann, c_ann = spec(int(fld), mqt, circ)
    return circ, mqt, m_ann, c_ann


def _verdict(mqt, circ) -> str:
    return str(verify(mqt, circ, **_KW).equivalence).split(".")[-1]


def _pick_folder(fam: str) -> str | None:
    flds = V._folders(fam)
    if not flds:
        return None
    pref = _PREFERRED.get(fam)
    return pref if pref in flds else flds[len(flds) // 2]


def _fault_injection(fam: str, fld: str) -> int:
    """Return count of anomalies for one case (2a)."""
    circ0, _, _, c_ann = _load(fam, fld)
    gset, aset = set(c_ann["garbage"]), set(c_ann["ancilla"])
    nq = circ0.num_qubits
    print(f"\n{fam}/{fld}  q={nq}  ancilla={sorted(aset)}  garbage={sorted(gset)}")
    anomalies = 0
    for q in range(nq):
        circ, mqt, ma, ca = _load(fam, fld)
        circ.x(q)  # inject a known fault
        V._apply(mqt, ma)
        V._apply(circ, ca)
        v = _verdict(mqt, circ)
        if q in gset:
            ok = v == "equivalent"
            note = "swallowed (expected)" if ok else "CAUGHT (unexpected)"
        else:
            ok = v != "equivalent"
            note = "caught (good)" if ok else "HIDDEN <-- BAD over-mark!"
        anomalies += not ok
        role = "garbage" if q in gset else "CHECKED"
        print(f"   X@q{q:<2} [{role}] -> {v:<16} {note}")
    return anomalies


def _ablation(fam: str, fld: str) -> None:
    """Drop the ancillary annotation and report whether the verdict flips (2b)."""
    _, _, m_ann, c_ann = _load(fam, fld)
    if not (c_ann["ancilla"] or m_ann["ancilla"]):
        print(f"\n{fam}/{fld}: no ancilla marks -> ablation N/A")
        return
    circ, mqt, ma, ca = _load(fam, fld)
    V._apply(mqt, ma)
    V._apply(circ, ca)
    base = _verdict(mqt, circ)
    circ, mqt, ma, ca = _load(fam, fld)
    V._apply(mqt, {"ancilla": [], "garbage": ma["garbage"]})
    V._apply(circ, {"ancilla": [], "garbage": ca["garbage"]})
    abl = _verdict(mqt, circ)
    if base == "equivalent" and abl != "equivalent":
        tag = "load-bearing (flips)"
    elif abl == "equivalent":
        tag = "superfluous-but-harmless (stays equivalent)"
    else:
        tag = "other"
    print(f"\n{fam}/{fld}: baseline={base}  ablated(no-ancilla)={abl}  -> {tag}")


def main(argv: list[str]) -> int:
    families = argv[1:] if len(argv) > 1 else list(V._SPECS)

    print("=" * 78)
    print("2a  fault injection (garbage / output direction)")
    print("=" * 78)
    total_anomalies = 0
    picks: list[tuple[str, str]] = []
    for fam in families:
        if fam not in V._SPECS:
            print(f"[skip] unknown family {fam!r}")
            continue
        fld = _pick_folder(fam)
        if fld is None:
            print(f"[skip] {fam}: no complete folders")
            continue
        picks.append((fam, fld))
        total_anomalies += _fault_injection(fam, fld)
    print(f"\n2a summary: {'ALL AS EXPECTED' if not total_anomalies else str(total_anomalies) + ' ANOMALIES'}")

    print("\n" + "=" * 78)
    print("2b  ancilla ablation (input / |0> direction)")
    print("=" * 78)
    for fam, fld in picks:
        _ablation(fam, fld)

    return 1 if total_anomalies else 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
