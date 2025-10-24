# EvoSynth: Enabling Multi-Target Drug Discovery through Latent Evolutionary Optimization and Synthesis-Aware Prioritization

## 1. Download Pretrained Checkpoints

Pretrained EvoSynth checkpoints are publicly available on **Zenodo**.  
They can be downloaded and extracted into the project directory using the following commands:

```bash
# Move into the MolSculptor project directory
cd MolSculptor/

# Download both pretrained checkpoints from Zenodo
wget https://zenodo.org/record/17351094/files/auto-encoder.zip
wget https://zenodo.org/record/17351094/files/diffusion-transformer.zip

# Extract them into the checkpoints directory
unzip auto-encoder.zip -d checkpoints/
unzip diffusion-transformer.zip -d checkpoints/
```

## 2. Run EvoSynth Inference

Once the checkpoints are downloaded, molecular generation can be performed using the provided shell script:

```bash
bash ./MolSculptor/diff_evo_opt_dual.sh
```

This script runs the dual-target optimization pipeline with the pretrained EvoSynth model. Before execution, users should review and update the parameters to suit their specific use case.

## 3. Run Synthesis-Aware Prioritization with SPARROW

After molecule generation, the resulting `.pkl` file (e.g., `diffusion_es_opt.pkl`) can be processed and evaluated for synthetic feasibility using **SPARROW**.

### Step 1. Prepare Input for SPARROW

First, convert the EvoSynth output to a CSV format compatible with SPARROW using the provided shell script:

```bash
bash ./MolSculptor/prepare_sparrow_input.sh
```

Before running, please review and update the parameters inside prepare_sparrow_input.sh to ensure they match your experiment setup.

### Step 2. Run SPARROW Prioritization

Once the input file is prepared, execute **SPARROW** to perform synthesis-aware candidate prioritization using the provided shell script:

```bash
bash ./sparrow/run.sh
```

Before running, make sure to review and modify the parameters in run.sh to match your setup.

## Access Docking Datasets

The docking datasets used for EvoSynth fine-tuning are provided in the `data/` directory.

```bash
MolSculptor/
└── data/
    ├── case_jnk3-gsk3b_docking_scores.csv
    └── case_parp1-pik3ca_docking_scores.csv
```

These files provide the affinity labels used to fine-tune and evaluate EvoSynth across both dual-target scenarios.

## Acknowledgment

This work builds directly upon two prior open-source frameworks that form the foundation of **EvoSynth**. If you use this repository, please also cite the following works alongside our paper.

- **[MolSculptor](https://github.com/egg5154/MolSculptor):** A diffusion-evolution framework for multi-site inhibitor design.
```bibtex
@article{li2025molsculptor,
  title={MolSculptor: an adaptive diffusion-evolution framework enabling generative drug design for multi-target affinity and selectivity},
  author={Li, Yanheng and Lin, Xiaohan and Hao, Yize and Zhang, Jun and Wu, Yundong and Gao, Yi Qin},
  year={2025}
}
```

- **[SPARROW](https://github.com/coleygroup/sparrow):** An algorithmic framework for synthetic cost-aware decision making in molecular design.

```bibtex
@article{fromer2024algorithmic,
  title={An algorithmic framework for synthetic cost-aware decision making in molecular design},
  author={Fromer, Jenna C and Coley, Connor W},
  journal={Nature Computational Science},
  volume={4},
  number={6},
  pages={440--450},
  year={2024},
  publisher={Nature Publishing Group US New York}
}
```

## Please cite our work!




