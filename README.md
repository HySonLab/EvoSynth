# EvoSynth: Enabling Multi-Target Drug Discovery through Latent Evolutionary Optimization and Synthesis-Aware Prioritization

Published at *Nature - Communications Chemistry*, DOI 10.1038/s42004-026-01945-4

https://www.nature.com/articles/s42004-026-01945-4

## 1. Download Pretrained Checkpoints

Pretrained EvoSynth checkpoints are publicly available on **Zenodo**.  
They can be downloaded and extracted into the project directory using the following commands:

```bash
# Create and move into the checkpoints directory
mkdir -p MolSculptor/checkpoints
cd MolSculptor/checkpoints

# Download pretrained checkpoints from Zenodo
wget https://zenodo.org/records/17351094/files/auto-encoder.zip
wget https://zenodo.org/record/17351094/files/diffusion-transformer.zip

# Extract the checkpoint archives
unzip auto-encoder.zip
unzip diffusion-transformer.zip
```

Alternatively, the pretrained models can also be downloaded from Hugging Face: https://huggingface.co/HySonLab/EvoSynth

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

## Please cite our work:

```bibtex
@article {Nguyen2025.11.04.686584,
	author = {Nguyen, Viet Thanh Duy and Pham, Phuc and Hy, Truong-Son},
	title = {EVOSYNTH: Enabling Multi-Target Drug Discovery through Latent Evolutionary Optimization and Synthesis-Aware Prioritization},
	elocation-id = {2025.11.04.686584},
	year = {2025},
	doi = {10.1101/2025.11.04.686584},
	publisher = {Cold Spring Harbor Laboratory},
	abstract = {Complex diseases, such as cancer and neurodegeneration, feature interconnected pathways, making single-target therapies ineffective due to pathway redundancy and compensatory mechanisms. Polypharmacy, which combines multiple drugs to target distinct proteins, addresses this but often leads to drug-drug interactions, cumulative toxicity, and complex pharmacokinetics. To overcome these challenges, we introduce EVOSYNTH, a modular framework for multi-target drug discovery that combines latent evolution and synthesis-aware prioritization to generate and prioritize candidates with high translational potential. Latent evolution navigates a chemically and functionally informed latent space to identify candidates with strong predicted affinity across multiple targets. Synthesis-aware prioritization evaluates both retrosynthetic feasibility and the trade-off between synthetic cost and therapeutic reward, enabling practical and efficient candidate selection. Applied to dual inhibition of JNK3 and GSK3-beta in Alzheimer{\textquoteright}s disease and PI3K and PARP1 in ovarian cancer, EVOSYNTH consistently outperforms baseline generative models, achieving higher predicted affinities, improved scaffold diversity, and lower synthesis costs. These findings highlight EVOSYNTH{\textquoteright}s ability to integrate target-driven generation with practical synthesizability, establishing a scalable framework for multi-target and polypharmacological drug discovery. Our source code and data to reproduce all experiments is publicly available on GitHub at: https://github.com/HySonLab/EvoSynthCompeting Interest StatementThe authors have declared no competing interest.},
	URL = {https://www.biorxiv.org/content/early/2025/11/05/2025.11.04.686584},
	eprint = {https://www.biorxiv.org/content/early/2025/11/05/2025.11.04.686584.full.pdf},
	journal = {bioRxiv}
}
```




