#!/bin/bash



#================ SLURM Directives ================#

#SBATCH --job-name=baseline_eval

#SBATCH --nodes=1

#SBATCH --ntasks-per-node=2

#SBATCH --time=02:00:00

#SBATCH --partition=h200_normal_q

#SBATCH --account=ece_6514

#SBATCH --gres=gpu:1

#SBATCH --output=~/llm_baseline/logs/%x_%j.out



#================ Environment Setup ================#

module load Miniconda3

module load CUDA/12.6.0

source /apps/common/software/Miniconda3/24.7.1-0/etc/profile.d/conda.sh

conda activate myeval



#================ Baseline Evaluation ================#

mkdir -p ~/llm_baseline/outputs

cd ~/lighteval



# Example baseline evaluation command

lighteval evaluate \

  --model hf-causal \

  --model_args pretrained=Qwen/Qwen2.5-3B-Instruct,dtype=bfloat16 \

  --tasks aime24,math500,gpqa,logiqa \

  --num_fewshot 0 \

  --batch_size 1 \

  --output_path ~/llm_baseline/outputs/baseline_qwen3b
