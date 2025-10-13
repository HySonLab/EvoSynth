# #!/bin/bash

python ./diff_evo_opt_dual.py \
    --params_path $SCRIPT_DIR./checkpoints/diffusion-transformer/contrastive_loss/dit_params_finetune_parp1-pik3ca.pkl \
    --config_path $SCRIPT_DIR./checkpoints/diffusion-transformer/config_opt.pkl \
    --logger_path $SCRIPT_DIR./cases/case_parp1-pik3ca/test_finetune_contrastive_loss_with_tox/Logs.txt \
    --save_path $SCRIPT_DIR./cases/case_parp1-pik3ca/test_finetune_contrastive_loss_with_tox \
    --dsdp_script_path_1 $SCRIPT_DIR./cases/case_parp1-pik3ca/dsdp_parp1.sh \
    --dsdp_script_path_2 $SCRIPT_DIR./cases/case_parp1-pik3ca/dsdp_pik3ca.sh \
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
    --sampling_method 'beam' \
    --beam_size 4 \
    --vae_config_path $SCRIPT_DIR./checkpoints/auto-encoder/config.pkl \
    --vae_params_path $SCRIPT_DIR./checkpoints/auto-encoder/contrastive_loss/ae_params_finetuned_parp1-pik3ca.pkl \
    --alphabet_path $SCRIPT_DIR./train/smiles_alphabet.pkl \
    --init_molecule_path $SCRIPT_DIR./cases/case_parp1-pik3ca/init_search_molecule.pkl \
    --sub_smiles 'O=C1C=C(OC2=C1C=CC=C2)'
exit