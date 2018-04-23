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

Then we did a number of population genetic analyses:

* We used the program diveRsity in R to measure allelic richness, expected heterozygosity, Hardy-Weinberg Equilibrium and pairwise GST. These scripts can be found in the folder ***diveRsityAnalyses***

* We used the program STRUCTURE to identify genetic clusters within the data. All of this code, output etc. can be found in the sub-folder ***STRUCTURE***

* We attempted the program BayesAss to measure migration. Despite getting the program to run, we found that the output seemed to be problematic. Discussion with colleagues suggested that the program is highly problematic. So we sadly chose to not include this program in our analyses. The script used can be found in *bayesassproblems.txt*

* We attempted the program NeEstimator to measure effective population size, however this program is only useable as a GUI. Then, we attempted to run the LDNe package in R to measure effective population size, but it had recently been updated to only work with SNP data and not with microsatellite data. The scripts can be found in the folder ***NeEstimator***

* The overall allelic richness, expected heterozygosity, Hardy-Weinberg Equilibrium and pairwise GST for each population was extracted. Then various statistical tests were used to see if there were significant differences for these values between the Big File and Newfoundland file. These values were also used in the climate analyses.

We also performed a number of analyses using both climate data and population genetic data obtained from the microsatellite data:

* For each latitude and longitude, we used R to extract current mean annual temperature from the WorldClim database. Then, we used R to extract past and future mean annual temperature (both extrapolated based on a GISS model). Lastly, we determined the overall temperature trend and direction of the slope and added this to the dataset. The scripts can be found in the folder ***ClimateData***

* Using this new dataset, we performed regressions to determine if trend in temperature shares a relationship with indices of genetic diversity or conservation status - also found in ***ClimateData*** . Indices of genetic diversity included allelic richness, expected heterozygosity, and Hardy-Weinberg p-values, which were extracted from the diveRsity analysis output file. The extraction scripts can be found in the folder ***HWE code*** . Code for determining the conservation status of populations is found in ***Maps*** .

* Figures to demonstrate the climate regressions with genetic diversity or conservation status are found in ***Climate Figures*** 

* We created multiple maps in R to display sampling locations, areas of endangered populations, and mean annual temperature. Raster maps displaying mean annual temperature with either endangerment status or HW p-values and the codes used to produce them are found in the folder ***Maps*** .

