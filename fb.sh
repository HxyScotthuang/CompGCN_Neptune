#!/bin/bash

#SBATCH --time=11:59:59
#SBATCH --job-name=compgcn
#SBATCH --ntasks-per-node=1
#SBATCH --partition=short
#SBATCH --gres=gpu:v100:1 

module purge
module load Anaconda3
source activate $DATA/myenv

pip install -r requirements.txt

python run.py -score_func distmult -opn mult -gcn_layer 3 -gpu 0 -data FB15k-237 -name FB 
