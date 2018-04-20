# Salmon-Project
Population genetics using microsatellites for different salmonid species

First we found two dryad pages:
https://datadryad.org/resource/doi:10.5061/dryad.sb601/1
https://datadryad.org/resource/doi:10.5061/dryad.7tv21

Both of these data sources contained Atlantic salmon from North America, and the genetic analyses involved the same 15 microsatellites.

One file contained salmon throughout the North American range, including Newfoundland (the "Big File"). The other file contained salmon just in Newfoundland (the "Newfoundland file").

The files were downloaded using the batch script *downloadfile.sh*

The Big File was already in Genepop format, so easy to use.
The Newfoundland file was in a .csv file with no specific format.

We used python to transform this .csv file into Genepop format. These python files can be found in ***FileConversions/scripts***
We also added the Newfoundland populations from the Big File, to make one Big Newfoundland file.

Then we built the program ***PGDSpider*** into our project folder in the command line.
This can be found in ***FileConversions/PGDSpider***
We used this to convert the Genepop files into STRUCTURE and IMMANC format for further analyses

Then we did a number of analyses:

* We used the program diveRsity in R to measure allelic richness, expected heterozygosity, Hardy-Weinberg Equilibrium and pairwise GST. These scripts can be found in the folder ***diveRsityAnalyses***

* We used the program STRUCTURE to identify genetic clusters within the data. All of this code, output etc. can be found in the sub-folder ***STRUCTURE***

* We attempted the program BayesAss to measure migration. Despite getting the program to run, we found that the output seemed to be problematic. Discussion with colleagues suggested that the program is highly problematic. So we sadly chose to not include this program in our analyses. The script used can be found in *bayesassproblems.txt*

* The overall allelic richness, expected heterozygosity, Hardy-Weinberg Equilibrium and pairwise GST for each population was extracted. Then various statistical tests were used to see if there were significant differences for these values between the Big File and Newfoundland file. These values were also used in the climate analyses.

