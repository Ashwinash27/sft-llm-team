#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=01:00:00
#SBATCH --partition=h200_normal_q
#SBATCH --account=ece_6514
#SBATCH --gres=gpu:1
#SBATCH --output=/home/sashwin02/llm_baseline/logs/eval_mmlu_%j.out
#SBATCH --error=/home/sashwin02/llm_baseline/logs/eval_mmlu_%j.out
set -euo pipefail
mkdir -p /home/sashwin02/llm_baseline/logs
module load Miniconda3 2>/dev/null || true
module load CUDA/12.6.0
source /apps/common/software/Miniconda3/24.7.1-0/etc/profile.d/conda.sh || true
conda activate myeval
export VLLM_WORKER_MULTIPROC_METHOD=spawn
NUM_GPUS=1
MODEL=Qwen/Qwen2.5-3B-Instruct
MODEL_ARGS="model_name=$MODEL,dtype=bfloat16,tensor_parallel_size=$NUM_GPUS,max_model_length=32768,gpu_memory_utilization=0.70,generation_parameters={max_new_tokens:32768,temperature:0.6,top_p:0.95}"
OUTPUT_DIR=/home/sashwin02/llm_baseline/outputs/base_mmlu
mkdir -p "$OUTPUT_DIR"
echo "[`date`] Starting MMLU eval on ${MODEL} ..."
lighteval vllm $MODEL_ARGS "lighteval|mmlu_redux_2|0|0" \
  --output-dir "$OUTPUT_DIR"
echo "[`date`] Done. Results in: $OUTPUT_DIR"
