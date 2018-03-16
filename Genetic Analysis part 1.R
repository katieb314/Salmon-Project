#GENETIC ANALYSIS PART 1
#First step: input the file from the Git environment into this R file
#I used getwd() to find out the file path so that I can add the file to the environment
getwd()

#this is the file path for our data file
"/Users/lilacolston-nepali/Salmon-Project/Ssalar_usat_genepop_23Sep2014.txt?sequence=1.1"

#The genetic analysis program I will be using is in a package called diveRsity
install.packages("diveRsity")
library(diveRsity)

#The 
devtools::install_github('wrengels/HWxtest', subdir='pkg')

basicStats(infile = "/Users/lilacolston-nepali/Salmon-Project/Ssalar_usat_genepop_23Sep2014.txt?sequence=1.1", outfile ="/Users/lilacolston-nepali/Salmon-Project/StrucBig")
