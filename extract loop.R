setwd("C:/Queens First/BIOL 812 Bioinformatics/Group Project")
#Set working directory for when I write the new file to it
require(RCurl)
dat <- read.table(text=getURL("https://raw.githubusercontent.com/katieb314/Salmon-Project/master/HWEBigFile-%5BdiveRsity%5D_BigFile/%5BdivBasic%5D.txt"))
#Used the RCurl package to download a data frame from our GitHub account

newdat<- matrix(ncol = 4, nrow = 0)
y <- c('Populations', 'Allelic Richness', 'Expected Het', 'HWE Values')
colnames(newdat) <- y
#Above I created an empty matrix with the above names as column headers


for(i in grep("-", dat$V1)){
  pop <- as.character(dat$V1[i])
  avg <- c(i+4,i+6,i+7)
  avgs <- as.numeric(as.character((dat$V17[avg])))
  newrow <- c(pop,avgs)
  newdat <- rbind(newdat,newrow)
}
#This loop selected every string with "-" in it, selecting for the population names, it also
#selected the overall values needed for Ar, He, and HWE. I used rbind to merge these extracted
#values to the empty matrix, created above.


newdat1 <- data.frame(newdat)
newdat1[,1:4] <- lapply(newdat1[,1:4], as.character)
newdat1[,2:4] <- lapply(newdat1[,2:4], as.numeric)
#Used lapply to change all of the population labels to characters, and the values to numbers

write.csv(newdat1, "Extracted_HWE.csv")
#Wrote the new dataset to a csv and saved in working directory
