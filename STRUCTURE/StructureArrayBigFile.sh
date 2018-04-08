#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0
#SBATCH --array=2-15:1
#SBATCH --output=arrayJob_%A_%a.out

echo 'This is a job step '${SLURM_ARRAY_TASK_ID}

module load structure
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparamsbigfile -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K ${SLURM_ARRAY_TASK_ID}
