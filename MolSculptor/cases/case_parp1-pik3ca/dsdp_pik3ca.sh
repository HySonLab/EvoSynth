#!/bin/bash

DSDP_BIN="/home/dvnguye2/MolSculptor/dssp/DSDP"

"$DSDP_BIN" \
	--ligand $1\
	--protein $(dirname "${BASH_SOURCE[0]}")/pik3ca.pdbqt\
	--box_min 12.820 53.470 13.788 \
	--box_max 29.771 71.246 29.460 \
	--exhaustiveness 384 --search_depth 40 --top_n 4\
	--out $2\
	--log $3