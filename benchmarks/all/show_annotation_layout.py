#!/usr/bin/python3
"""Print the ancilla/garbage annotation layout that ``verify_equivalence.py``
applies, GENERATED from its spec logic and the actual circuit widths (nothing is
hand-asserted). For each family and a few folders it shows:

  * ``q``            total circuit qubits,
  * ``ancilla``      circuit qubits marked |0>-on-input,
  * ``garbage``      circuit qubits whose output is don't-care,
  * ``anc_but_read`` ancilla that is NOT garbage -> |0> on input but output IS
                     compared (the arithmetic result registers), and
  * a one-line register-role interpretation.

Use it to eyeball that every marked index is genuinely scratch / don't-care and
that folder number ``k`` maps to the intended logical size ``n``.

    ../../../q_bench/.venv/bin/python show_annotation_layout.py            # all
    ../../../q_bench/.venv/bin/python show_annotation_layout.py Multiplierall  # one
"""
from __future__ import annotations

import sys

from mqt.core.ir import QuantumComputation

import verify_equivalence as V

_ROLE = {
    "DJall": "k=n qubits; top qubit = phase-kickback ancilla (|1>, unmeasured) -> anc+garbage",
    "Qwalkall": "k=n mqt qubits shared low; extra HIGH = mcx v-chain clean ancilla -> anc+garbage",
    "Graphstateall": "k=n mqt qubits; no mcx expansion -> nothing marked",
    "CDKMAdderall": "k=n mqt qubits; extra HIGH (if any) = v-chain ancilla",
    "VBEAdderall": "k=n mqt qubits (incl mqt's own helper); extra HIGH = v-chain ancilla",
    "FullAdderall": "k=n mqt qubits; extra HIGH = v-chain ancilla",
    "HalfAdderall": "k=n mqt qubits; extra HIGH = v-chain ancilla",
    "ModularAdderall": "circ=[a(n) b(n) help(1)], k=n; result=b (checked), help=top -> anc+garbage",
    "Multiplierall": "circ=[a(n) b(n) out(2n) cout/help/vchain], k=n; out=[2n,4n) anc-but-READ; [4n,q) scratch",
    "HRSMultiplierall": "same builder as Multiplier; out=[2n,4n) anc-but-READ; [4n,q) scratch",
}


def _ann_for(fam: str, fld: str):
    d = V.HERE / fam / fld
    circ = QuantumComputation.from_qasm(str(d / "circuit.qasm"))
    mqt = QuantumComputation.from_qasm(str(d / "mqt_bench.qasm"))
    spec = V._SPECS[fam]
    if spec is None:
        _, c_ann = V._high_ancilla_only(mqt, circ)
    else:
        _, c_ann = spec(int(fld), mqt, circ)
    return circ.num_qubits, c_ann


def main(argv: list[str]) -> int:
    families = argv[1:] if len(argv) > 1 else list(V._SPECS)

    print(f"{'FAMILY':<17}{'fld':>4}{'q':>4}  "
          f"{'ancilla':<24}{'garbage':<16}{'anc_but_read':<16}")
    print("-" * 92)
    for fam in families:
        if fam not in V._SPECS:
            print(f"[skip] unknown family {fam!r}")
            continue
        flds = V._folders(fam)
        if not flds:
            print(f"[skip] {fam}: no complete folders")
            continue
        sample = ([flds[0], flds[len(flds) // 2], flds[-1]]
                  if len(flds) >= 3 else flds)
        for fld in sample:
            q, c_ann = _ann_for(fam, fld)
            anc = sorted(c_ann["ancilla"])
            gar = sorted(c_ann["garbage"])
            anc_read = sorted(set(anc) - set(gar))
            print(f"{fam:<17}{fld:>4}{q:>4}  "
                  f"{str(anc):<24}{str(gar):<16}{str(anc_read):<16}")
        print(f"   >> {_ROLE[fam]}\n")
    return 0


if __name__ == "__main__":
    raise SystemExit(main(sys.argv))
