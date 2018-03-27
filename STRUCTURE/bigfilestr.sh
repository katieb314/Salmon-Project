#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0

module load structure
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparams_bigfile -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 2
