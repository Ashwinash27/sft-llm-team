Project Reasoning SFT-LLM Team

This repository contains our Supervised Fine-Tuning (SFT) project for improving reasoning abilities in Large Language Models (LLMs).
We use Qwen2.5-3B-Instruct and fine-tune it on curated subsets of the AceReason-1.1-SFT dataset to study how dataset diversity affects reasoning and analytical performance.

⸻
 Hugging Face Links

Artifact	Hugging Face Link	Description
Diverse15k Dataset	HF Dataset: acereason-diverse15k	Diverse 15 K subset covering math, logic, and analytical prompts.
Random15k Dataset	HF Dataset: acereason-random15k	Random 15 K subset used as baseline for comparison.
Fine-tuned Model (Diverse)	HF Model: qwen2.5-3b-diverse15k-sft	Model trained on the diverse subset.
Fine-tuned Model (Random)	HF Model: qwen2.5-3b-random15k-sft	Model trained on the random subset.


⸻

Repository Structure and Folder Descriptions

Folder / File	Description
arc_setup/	Environment setup scripts and dependency files for ARC cluster or local installation.
configs/	YAML configuration files for model training and evaluation (e.g., sft_config.yaml).
jobs/	SLURM job scripts for running training or evaluation on HPC clusters (run_sft.sh, eval_sft.sh).
results/	Evaluation outputs and CSV files comparing baseline vs fine-tuned models.
sft-llm-team/	Main project folder containing experiment code, checkpoints, and logs.
.ipynb_checkpoints/	Auto-saved Jupyter Notebook checkpoints.
prep_data.py	Script used to stream and sample datasets (random15k.json, diverse15k.json) from AceReason-1.1-SFT.
dataset_info.json	Maps dataset files to training keys for LLaMA-Factory (links input/output to prompt/response).
Project 1 Write-up.pdf	Final project report detailing methodology, results, and conclusion.
README.md	Project overview, setup, dataset/model links, and team details.
.gitignore	Specifies files ignored by Git (checkpoints, cache, etc.).


⸻
 Datasets Summary

Diverse15k

A curated 15 K subset emphasizing diversity in task type and complexity.
	•	Covers math, logic, commonsense, and analytical reasoning.
	•	Format:

{ "input": "Problem statement or instruction", "output": "Model reasoning and answer" }


	•	dataset_info.json entry:

"diverse15k": {
  "file_name": "diverse15k.json",
  "columns": { "prompt": "input", "response": "output" }
}



Random15k

A randomly sampled 15 K subset from AceReason, used as a baseline for comparison.

⸻

⚙️ How to Run Training and Evaluation
	1.	Clone the repository

git clone https://github.com/Ashwinash27/sft-llm-team.git
cd sft-llm-team


	2.	Create and activate environment

conda create -n reason-sft python=3.10
conda activate reason-sft
pip install -r arc_setup/requirements.txt


	3.	Prepare datasets

python prep_data.py

This generates data/prepared/diverse15k.json and data/prepared/random15k.json.

	4.	Run fine-tuning

bash jobs/run_sft.sh

(Set dataset: diverse15k or random15k inside sft_config.yaml.)

	5.	Evaluate results

bash jobs/eval_sft.sh

Results will be saved in the results/ folder.

⸻
Team Members

Name	Role
Avanthika Rajesh	Data preparation & Hugging Face dataset publishing
Ashwin A.	Repository setup, configuration, and training pipeline
Gayathri	Report writing, results analysis, and documentation
Ashley Ferraro	Model fine-tuning & evaluation pipeline


⸻
Citation

“Project Reasoning SFT-LLM,” ECE 5424 – Advanced Machine Learning, Virginia Tech, 2025.


