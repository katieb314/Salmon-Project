getwd()

f <- file.choose()
HWE <- read.table(f, header = FALSE)
View(HWE)

#conversely could have done read.table("~/HWEBigFile-[diveRsity]_BigFile/[divBasic].txt", header=FALSE), but this was not working properly for me

#To extract the names of each observation

HWEnamestest<- HWE[seq(1,nrow(HWE),8),] #picking out the rows with the names
View(HWEnamestest)

HWEnames <- HWEnamestest$V1 #picking out the column with the names
View(HWEnames)

# to extract the Values that we are interested in
HWEvalues<- HWE[seq(8,nrow(HWE),8),] # this is extracting HWE p values
View(HWEvalues)

HWEar <- HWE[seq(5, nrow(HWE), 8),] # this is extracting allelic richness
View(HWEar)

HWEhet <- HWE[seq(7, nrow(HWE), 8),] #this is extracting expected heterozygosity

#Now I want to make a dataframe to put the values I'm extracting into:

HWEdat <- as.data.frame(matrix(ncol=4, nrow=nrow(HWEnamestest))) #making an empty dataframe to put the HWE info into
HWEdat
colnames(HWEdat) <- c("Populations", "Allelic Richness", "Expected Het", "HWE values") #naming the columns

HWEdat$Populations <- HWEnames #putting population names into the first column
HWEdat$`Allelic Richness` <- HWEar$V17 #putting ONLY overall allelic richness for each population into second column
HWEdat$`Expected Het`<- HWEhet$V17 #overall expected heterozygosity into second column
HWEdat$`HWE values` <- HWEvalues$V17 #overall HWE p values into last column

head(HWEdat) #checking to make sure it all worked


write.csv(HWEdat, file="HWEdat.csv") #writing into a new datafile that we can use for more analyses

