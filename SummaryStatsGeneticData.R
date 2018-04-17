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


'''
Now we do the same for the Newfoundland file
'''

# First I need the data set. I'll put it into another object called GenDat
# (I'm working inside our Salmon-Project directory, so all the docs are already here, no need for a file path)

NFGenDat <- read.csv("HWEdatNFL.csv")

#I'll calculate the mean and the range (min and max) for each score
#I'll save each in an object to put them all together later for further analysis
#Allelic Richness
ARMeanNF <- mean(NFGenDat$Allelic.Richness)

ARMinNF <- min(NFGenDat$Allelic.Richness)

ARMaxNF <- max(NFGenDat$Allelic.Richness)

ARRangeNF <-ARMaxNF - ARMinNF

#Expected hetero

EHMeanNF <- mean(NFGenDat$Expected.Het)

EHMinNF <- min(NFGenDat$Expected.Het)

EHMaxNF <- max(NFGenDat$Expected.Het)

EHRangeNF <-EHMaxNF - EHMinNF

# Make a simple data frame for allelic richness and expected heterozygosity
#Allelic Richness
Mean1 <- c(ARMean, ARMeanNF)
Min1 <- c(ARMin, ARMinNF)
Max1 <- c(ARMax, ARMaxNF)
Range1 <- c(ARRange, ARRangeNF)

#Expected Hetero
Mean2 <- c(EHMean, EHMeanNF)
Min2 <- c(EHMin, EHMinNF)
Max2 <- c(EHMax, EHMinNF)
Range2 <- c(EHRange, EHRangeNF)

#Making the frame
ARFrame <- data.frame(Mean1, Min1, Max1, Range1)
EHFrame <- data.frame(Mean2, Min2, Max2, Range2)

#Adding row names
rownames(ARFrame) <- c("BigFile", "Newfoundland")
rownames(EHFrame) <- c("BigFile", "Newfoundland")

'''
To compare if the mean allelic richness and expected heterozygosity differ significantly
between the two files, we can use a t-test.
'''

t.test(GenDat$Allelic.Richness, NFGenDat$Allelic.Richness)

'''
Result
Welch Two Sample t-test

data:  GenDat$Allelic.Richness and NFGenDat$Allelic.Richness
t = -26.267, df = 86.898, p-value < 2.2e-16
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
-4.686750 -4.027356
sample estimates:
mean of x mean of y 
8.012222 12.369275 

Significantly higher allelic richness in Newfoundland
'''

t.test(GenDat$Expected.Het, NFGenDat$Expected.Het)

'''
Result
Welch Two Sample t-test

data:  GenDat$Expected.Het and NFGenDat$Expected.Het
t = -1.199, df = 142.94, p-value = 0.2325
alternative hypothesis: true difference in means is not equal to 0
95 percent confidence interval:
-0.01346548  0.00329782
sample estimates:
mean of x mean of y 
0.8347712 0.8398551 

No significant difference in expected heterozygosity
'''
