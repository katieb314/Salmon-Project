'''
We calculated the Allelic richness and expected heterozygosity scores
for the 'BIG DATA' file of 153 populations.
This is ALOT of numbers!! So I want to come up with some basic summary 
statistics to allow us to make some generalization in our data analysis.

We can later compare between these values and the Newfoundland only populations using
basic statistics such as chi-square tests to see if the scores differ significantly
'''

# First I need the data set. I'll put it into another object called GenDat
# (I'm working inside our Salmon-Project directory, so all the docs are already here, no need for a file path)

GenDat <- read.csv("HWEdat.csv")

#I'll calculate the mean and the range (min and max) for each score
#I'll save each in an object to put them all together later for further analysis
#Allelic Richness
ARMean <- mean(GenDat$Allelic.Richness)

ARMin <- min(GenDat$Allelic.Richness)

ARMax <- max(GenDat$Allelic.Richness)

ARRange <-ARMax - ARMin

#Expected hetero

EHMean <- mean(GenDat$Expected.Het)

EHMin <- min(GenDat$Expected.Het)

EHMax <- max(GenDat$Expected.Het)

EHRange <-EHMax - EHMin

# Make a simple data frame

Mean <- c(ARMean, EHMean)
Min <- c(ARMin, EHMin)
Max <- c(ARMax, EHMax)
Range <- c(ARRange, EHRange)

#Making the frame
ResultsFrame <- data.frame(Mean, Min, Max, Range)

#Adding row names
rownames(ResultsFrame) <- c("Allelic Richness(BigFile)", "Expected Heterozygosity(BigFile")

View(ResultsFrame)

