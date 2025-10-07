# 🧠 SFT-LLM Team Project



Baseline and supervised fine-tuning (SFT) workflow for **Qwen2.5-3B-Instruct** on Virginia Tech’s ARC (Tinkercliffs) cluster using **LLaMA-Factory** and **LightEval**.



## 🚀 Setup (ARC Cluster)



```bash

module load Miniconda3

module load CUDA/12.6.0

eval "$(/apps/common/software/Miniconda3/24.7.1-0/bin/conda shell.bash hook)"

conda env create -f environment.yml

conda activate llama-factory

huggingface-cli login

