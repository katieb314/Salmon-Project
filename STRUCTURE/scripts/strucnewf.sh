#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0

module load structure
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland2 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 2
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland3 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 3
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland4 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 4
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland5 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 5
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland6 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 6
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland7 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 7
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland8 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 8
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland9 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 9
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland10 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 10
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland11 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 11
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland12 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 12
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland13 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 13
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland14 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 14
structure -m /global/home/hpc3579/salmon/mainparamsnewfoundlandfiles/mainparamsnewfoundland15 -e /global/home/hpc3579/salmon/extraparams_newfoundlandfile -K 15

