# SFT-LLM Team Project (ARC @ VT)

**What this repo contains**
- Two SLURM scripts to run baselines on Qwen2.5-3B-Instruct.
- A reproducible `environment.yml` to create the same Conda env.

## Team roles
- Person A – Environment + Baseline (this folder)
- Person B – Data preparation (will add later)
- Person C – Training (will add later)
- Person D – Post-training eval + report (will add later)

## ARC setup (copy–paste)
```bash
module load Miniconda3
module load CUDA/12.6.0
eval "$(/apps/common/software/Miniconda3/24.7.1-0/bin/conda shell.bash hook)"
conda env create -f environment.yml
conda activate llama-factory
huggingface-cli login
