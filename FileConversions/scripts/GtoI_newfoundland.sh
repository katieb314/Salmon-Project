#!/bin/bash
#SBATCH -c 4
#SBATCH --mem=8000
#SBATCH -t 14-0:0:0

java -Xmx1024m -Xms512m -jar PGDSpider2-cli.jar -inputfile /global/home/hpc3579/Salmon-Project/NLRegions.GENEPOP -inputformat GENEPOP -outputfile IMMANCOUTPUTNFL.txt -outputformat IMMANC -spid /global/home/hpc3579/Salmon-Project/FileConversions/NewfoundlandImmanc.txt.spid

