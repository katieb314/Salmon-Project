library(readr)
pairwise <- read_table2("resultsBigFile-[diffCalc]/pairwise.txt",col_names = FALSE, skip = 8)
View(pairwise[16:23,2:9]) ## this is all the data we want
PW<-pairwise[16:23,2:9]## dataframe of 8 objects and 8 variables of GST values wanted

sapply(PW, class) #determine if they're numeric so can run stats, they are chr
PW<-sapply(PW, as.numeric)
sapply(PW, class) #verify that they are now numeric, woohoo they are
sum(PW, na.rm=TRUE) # sum all values, removing NA's 4.7719
mean(PW, na.rm=TRUE) # mean of all values, excluding NA's, 0.1325528




