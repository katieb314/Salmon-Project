#!/bin/bash
#SBATCH – c 2
#SBATCH -- mem 20g
#SBATCH –t 1:00:00


#this command allows you to convert your input file of genepop format into your desired output file of Immanc


java -Xmx1024m -Xms512m -jar PGDSpider2-cli.jar -inputfile /global/home/hpc4055/Salmon-Project/FileConversions/BIGFILE.GENEPOP \
-inputformat GENEPOP -outputfile IMMANCOUTPUT.txt -outputformat  IMMANC -spid /global/home/hpc4055/Salmon-Project/FileConversions/GENEPOPTOIMMANC.txt.spid
