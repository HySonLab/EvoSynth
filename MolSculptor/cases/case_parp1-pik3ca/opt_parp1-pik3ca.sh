#!/bin/bash

export SCRIPT_DIR=$(dirname $(readlink -f $0))
python -u $SCRIPT_DIR/../../diff_evo_opt_dual.py \
    --params_path $SCRIPT_DIR/../../checkpoints/diffusion-transformer/dit_params_opt.pkl \
    --config_path $SCRIPT_DIR/../../checkpoints/diffusion-transformer/config_opt.pkl \
    --logger_path $SCRIPT_DIR/test_old/Logs.txt \
    --save_path $SCRIPT_DIR/test_old \
    --dsdp_script_path_1 $SCRIPT_DIR/dsdp_parp1.sh \
    --dsdp_script_path_2 $SCRIPT_DIR/dsdp_pik3ca.sh \
    --sampling_method 'beam' \
    --random_seed 8888 \
    --np_random_seed 8888 \
    --total_step 30 \
    --device_batch_size 128 \
    --t_min 70 \
    --t_max 80 \
    --n_replicate 8 \
    --num_latent_tokens 16 \
    --dim_latent 32 \
    --eq_steps 10 \
    --vae_config_path $SCRIPT_DIR/../../checkpoints/auto-encoder/config.pkl \
    --vae_params_path $SCRIPT_DIR/../../checkpoints/auto-encoder/ae_params_opt.pkl \
    --alphabet_path $SCRIPT_DIR/../../train/smiles_alphabet.pkl \
    --init_molecule_path $SCRIPT_DIR/init_search_molecule.pkl \
    --sub_smiles 'O=C1C=C(OC2=C1C=CC=C2)'
exit

# c1ccccc1
# O=C1C=C(OC2=C1C=CC=C2)