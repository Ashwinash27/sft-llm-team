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
# 1 Clone the team repository
git clone git@github.com:Ashwinash27/sft-llm-team.git
cd sft_llm_team

# 2 Load required ARC modules
module load Miniconda3
module load CUDA/12.6.0

# 3️ Initialize conda shell (enables conda commands)
eval "$(/apps/common/software/Miniconda3/24.7.1-0/bin/conda shell.bash hook)"

# 4️ Create the environment using your shared YAML
conda env create -f environment.yml

# 5️ Activate the environment
conda activate llama-factory

# 6️ Login to Hugging Face (for datasets + model access)
huggingface-cli login

