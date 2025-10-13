#!/bin/bash

DSDP_BIN="/home/dvnguye2/MolSculptor/dssp/DSDP"

"$DSDP_BIN" \
	--ligand $1\
	--protein $(dirname "${BASH_SOURCE[0]}")/parp1.pdbqt\
	--box_min -0.921 21.867 -0.799 \
	--box_max 42.022 49.795 44.261 \
	--exhaustiveness 384 --search_depth 40 --top_n 4\
	--out $2\
	--log $3