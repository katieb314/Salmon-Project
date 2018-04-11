'''
We calculated the Hardy-Weinberg Equilibrium scores
for the 'BIG DATA' file of 153 populations.
This is ALOT of numbers!! We need to be able to count how many of these are significant,
then we can compare this to the Newfoundland file.
'''

# First I need the data set. I'll put it into another object called HWEDat
# (I'm working inside our Salmon-Project directory, so all the docs are already here, no need for a file path)

GenDat <- read.csv("HWEdat.csv")

#I only want to look at Hardy-Weinberg scores so I need to specify that

HWEDat <- GenDat$HWE.values

#What we want is to create a loop and counter that will count how many significant values we have
#Signficant means less than 0.05

count<-0
for (i in HWEDat) {
  if (i < 0.05){
    count <- count+1
  }
}
NotAtEquil <- count


NotAtEquil
#This value was 44

