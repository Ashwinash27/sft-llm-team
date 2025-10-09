#!/bin/bash

#-- SLURM Job Directives --#
#SBATCH --nodes=1                   # Request a single node
#SBATCH --ntasks-per-node=2         # Request 2 CPU cores
#SBATCH --time=24:00:00              # Set a 1-hour time limit
#SBATCH --partition=h200_normal_q   # Specify the GPU partition: h200_normal_q, a100_normal_q on Tinkercliffs | a30_normal_q on Falcon
#SBATCH --account=ece_6514          # Your class-specific account
#SBATCH --gres=gpu:2                # Request 1 GPU

module load Miniconda3
module load CUDA/12.6.0

#-- Your Code Execution --#
# Ensure you are in the correct conda environment if necessary
source activate llama-factory

export FORCE_TORCHRUN=1

# Command to start the fine-tuning job
llamafactory-cli train sft_config.yaml

# If running a custom python script instead:
# python my_training_script.py
