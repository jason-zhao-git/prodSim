#! /usr/bin/env bash
#$ -S /bin/bash  # run job as a Bash shell [IMPORTANT]
#$ -cwd          # run job in the current working directory
#$ -N H1
#$ -j y 
#$ -l h_rt=02:00:00   # job requires up to 24 hours of runtime; use small times to dodge the queue
#$ -l compute_cap=86  # require A40- specifies GPU
#$ -l mem_free=2G
#$ -l gpu_mem=10000  #keeps the GPU free from other jobs; keep in MB

module load Sali
module load cuda/11.1
conda activate python39

export CUDA_VISIBLE_DEVICES=$SGE_GPU

python fake_exit.py
