#this command allows you to convert your input file of genepop format into your desired output file of structure format

#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0

java -Xmx1024m -Xms512m -jar PGDSpider2-cli.jar -inputfile /global/home/hpc3579/Salmon-Project/FileConversions/BIGFILE.GENEPOP -inputformat GENEPOP -outputfile STRUCTUREOUTPUT.txt -outputformat STRUCTURE -spid /global/home/hpc3579/Salmon-Project/FileConversions/GENEPOPTOSTRUC.txt.spid
