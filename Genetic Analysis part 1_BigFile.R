#GENETIC ANALYSIS PART 1
#First step: input the file from the Git environment into this R file
#I used getwd() to find out the file path so that I can add the file to the environment
getwd()

library(genepopedit)

#this is the file path for our data file
"/Users/lilacolston-nepali/Salmon-Project/Ssalar_usat_genepop_23Sep2014.txt?sequence=1.1"


#The genetic analysis program I will be using is in a package called diveRsity
install.packages("diveRsity")
library(diveRsity)

#The following will allow me to test Hardy-Weinberg equilibrium for the microsats
#another package needed
devtools::install_github('wrengels/HWxtest', subdir='pkg')

#this will calculate basic statistics on my data, including HWE
basicStats(infile = "/Users/lilacolston-nepali/Salmon-Project/Ssalar_usat_genepop_23Sep2014.txt?sequence=1.1", outfile ="/Users/lilacolston-nepali/Salmon-Project/StrucBig")

#The following will allow me to measure Fst

diffCalc(infile = "/Users/lilacolston-nepali/Salmon-Project/Ssalar_usat_genepop_23Sep2014.txt?sequence=1.1", outfile = "results", fst = TRUE, pairwise = TRUE,
         bs_locus = FALSE, bs_pairwise = FALSE, boots = NULL,
         ci_type = "individuals", alpha = 0.05, para = FALSE)

