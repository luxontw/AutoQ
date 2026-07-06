#!/usr/bin/python3
# Populate every existing size folder of the 10 mqt-derived families with a
# faithful, unmodified `mqt_bench.qasm` (OPENQASM 2.0) alongside its lowered,
# phase-free `circuit.qasm`. See mqt_autoq.dump_mqt_bench for what the file is.
#
# Only folders that ALREADY exist (i.e. were produced by the family's produce.py)
# get an mqt_bench.qasm — we do not create new sizes here. Run from anywhere:
#     python dump_mqt_bench_all.py
import os
import sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
from mqt_autoq import dump_mqt_bench

# family dir -> mqt-bench benchmark name
FAMILIES = {
    "DJall": "dj",
    "Qwalkall": "qwalk",
    "Graphstateall": "graphstate",
    "CDKMAdderall": "cdkm_ripple_carry_adder",
    "VBEAdderall": "vbe_ripple_carry_adder",
    "FullAdderall": "full_adder",
    "HalfAdderall": "half_adder",
    "ModularAdderall": "modular_adder",
    "Multiplierall": "multiplier",
    "HRSMultiplierall": "hrs_cumulative_multiplier",
}

for fam, name in FAMILIES.items():
    fam_dir = HERE / fam
    if not fam_dir.is_dir():
        print(f"[skip] {fam}: directory missing")
        continue
    existing = sorted(int(d.name) for d in fam_dir.iterdir() if d.is_dir() and d.name.isdigit())
    if not existing:
        print(f"[skip] {fam}: no size folders")
        continue
    print(f"### {fam} ({name}) — {len(existing)} folders")
    cwd = os.getcwd()
    os.chdir(fam_dir)
    try:
        dump_mqt_bench(name, existing)
    finally:
        os.chdir(cwd)
