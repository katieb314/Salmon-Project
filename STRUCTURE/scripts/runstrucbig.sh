#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0

module load structure
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile2 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 2
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile3 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 3
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile4 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 4
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile5 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 5
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile6 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 6
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile7 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 7
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile8 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 8
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile9 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 9
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile10 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 10
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile11 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 11
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile12 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 12
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile13 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 13
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile14 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 14
structure -m /global/home/hpc3579/Salmon-Project/STRUCTURE/mainparamsfiles/mainparams_bigfile15 -e /global/home/hpc3579/Salmon-Project/STRUCTURE/extraparams_bigfile -K 15

