'''
GENETIC ANALYSIS PART 1: now doing this for all the Newfoundland populations
First step: input the file from the Git environment into this R file
I used getwd() to find out the file path so that I can add the file to the environment
'''

getwd()

library(genepopedit)

#The genetic analysis program I will be using is in a package called diveRsity
install.packages("diveRsity")
library(diveRsity)

#The following will allow me to test Hardy-Weinberg equilibrium for the microsats
#another package needed
devtools::install_github('wrengels/HWxtest', subdir='pkg')

#This is the code to run some statistics- including HWE, allelic richness and expected heterozygosity on our file
divBasic(infile = "CombNL.GENEPOP", outfile = "HWENewfoundland", gp = 3)

#The following will allow us to measure Fst

diffCalc(infile = "/Users/lilacolston-nepali/Salmon-Project/CombNL.GENEPOP", outfile = "resultsNewfFile", pairwise = TRUE,
         bs_locus = FALSE, bs_pairwise = FALSE, boots = NULL,
         ci_type = "individuals", alpha = 0.05, para = FALSE)