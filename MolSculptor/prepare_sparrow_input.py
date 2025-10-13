import csv
import pickle as pkl
import numpy as np
import argparse
import os


def main():
    parser = argparse.ArgumentParser(
        description="Format EvoSynth output into a CSV for SPARROW evaluation."
    )
    parser.add_argument(
        "--input", "-i", required=True,
        help="Path to the EvoSynth-generated .pkl file (diffusion_es_opt.pkl)."
    )
    parser.add_argument(
        "--output", "-o", default="sparrow_input.csv",
        help="Output CSV filename (default: sparrow_input.csv)."
    )

    args = parser.parse_args()

    gen_file = args.input
    output_path = args.output

    # Validate input file
    if not os.path.exists(gen_file):
        raise FileNotFoundError(f"Input file not found: {gen_file}")

    print(f"[INFO] Loading EvoSynth results from: {gen_file}")
    with open(gen_file, "rb") as f:
        data = pkl.load(f)

    # Extract relevant fields
    scores_list = data["scores"]     # list of arrays (pop_size, 2)
    smiles_list = data["smiles"]     # list of lists (pop_size strings each)

    # Use last generation
    last_scores = np.array(scores_list[-1])  # shape: (pop_size, 2)
    last_smiles = smiles_list[-1]            # list of SMILES strings

    # Write output CSV
    print(f"[INFO] Writing results to: {output_path}")
    with open(output_path, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["SMILES", "Target1_Score", "Target2_Score", "Reward"])
        for smi, scores in zip(last_smiles, last_scores):
            t1_score, t2_score = scores
            avg_reward = (t1_score + t2_score) / 2
            writer.writerow([smi, f"{t1_score:.4f}", f"{t2_score:.4f}", f"{avg_reward:.4f}"])

    print("[DONE] CSV file successfully generated.")


if __name__ == "__main__":
    main()