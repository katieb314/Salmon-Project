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

HWEDat

#What we want is to create a loop and counter that will count how many significant values we have
#Signficant means less than 0.05

count<-0
for (i in HWEDat) {
  if (i < 0.05){
    count <- count+1
  }
}
NotAtEquil <- count

print(NotAtEquil)
#This value was 44

'''
We want to know what proportion of populations was not at Hardy-Weinberg equilibrium
This means we want to know how many out of the total number of populations had a signficant
p-value, which we just counted- 44.
'''

#Count the length of the vector HWEDat and save as TotalPops

TotalPops <- length(HWEDat)

#Calculate the percentage of populations not at equilibrium

PercentPops <- ((NotAtEquil/TotalPops)*100)
