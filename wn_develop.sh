#!/bin/bash

#SBATCH --job-name=compgcn_dev
#SBATCH --ntasks-per-node=1
#SBATCH --partition=devel
#SBATCH --gres=gpu:v100:1 
#SBATCH --mem-per-cpu=32G

module purge
module load Anaconda3
source activate $DATA/myenv

pip install -r requirements.txt

python run.py -score_func distmult -opn mult -gcn_layer 3 -gpu 0 -data WN18RR -name WN 
