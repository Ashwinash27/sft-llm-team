#!/bin/bash
#SBATCH --job-name=mmlu_eval
#SBATCH --nodes=1
#SBATCH --ntasks-per-node=2
#SBATCH --time=01:30:00
#SBATCH --partition=h200_normal_q      # or a100_normal_q / a30_normal_q depending on GPU
#SBATCH --account=ece_6514
#SBATCH --gres=gpu:1
#SBATCH --output=slurm-%j.out

module load Miniconda3
module load CUDA/12.6.0
# Proper conda activation (ARC method)
eval "$(/apps/common/software/Miniconda3/24.7.1-0/bin/conda shell.bash hook)"
conda activate /home/sashwin02/.conda/envs/llama-factory

export VLLM_WORKER_MULTIPROC_METHOD=spawn

NUM_GPUS=1
MODEL="Qwen/Qwen2.5-3B-Instruct"
MODEL_ARGS="model_name=${MODEL},dtype=bfloat16,tensor_parallel_size=${NUM_GPUS},max_model_length=32768,gpu_memory_utilization=0.80,generation_parameters={max_new_tokens:32768,temperature:0.6,top_p:0.95}"
OUTPUT_DIR="$PWD/outputs/mmlu_$(date +%Y%m%d_%H%M%S)"
mkdir -p "$OUTPUT_DIR"

# Run evaluation for MMLU-Redux-2
lighteval vllm $MODEL_ARGS "lighteval|mmlu_redux_2|0|0" \
  --output-dir "$OUTPUT_DIR"

echo "✅ MMLU Evaluation Complete!"
echo "Results saved in $OUTPUT_DIR"
