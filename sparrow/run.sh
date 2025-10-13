#!/usr/bin/env bash

TARGET_CSV="./sparrow/Alzheimer/CMD-GEN.csv"
OUTPUT_DIR="./sparrow/Alzheimer/CMD-GEN_results"

KEY_PATH="./sparrow/keys.py"

sparrow \
  --target-csv "$TARGET_CSV" \
  --output-dir "$OUTPUT_DIR" \
  --formulation linear \
  --path-finder api \
  --tree-host "localhost" \
  --recommender api \
  --context-host "localhost" \
  --scorer api \
  --scorer-host "localhost" \
  --coster chemspace \
  --key-path "$KEY_PATH" \
  --max-targets 10 \
  --max-rxns 50 \
  --reward-weight 1 \
  --start-cost-weight 1 \
  --reaction-weight 1 \
  --bayes-iters 10 \