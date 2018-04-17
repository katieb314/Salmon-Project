library(readr)
HWE <- read_table2("HWEBigFile-[diveRsity]_BigFile/[divBasic].txt",na = "empty")
View(HWE)
ncol(HWE) # figure out how many col to get overall and pop names only
Overall<-sapply(HWE[,17], as.numeric, na.rm=TRUE)
Pops<-HWE[,1]
hwe<-cbind(Pops,Overall) #bind the two columns into data frame called hwe to write loop for...
sapply(hwe,class) #veryify numeric overall values woohoo

####we want 

new_data<-c()
###create nested loops to pull out values from hwe dataframe
######last row of hwe oveall empty, not HWE. the last HWE value wanted in row 1375 of column 2

#range 1:1375

#for (i in 1:nrow(hwe){
#  if (hwe$Overall == 0.2993){
#    break{
#      else { 
#        repeat}
#    }
#  }
#}
##end of loop....
new_data[1]<- data.frame(hwe[7,1])
new_data2[1]<- data.frame(hwe[7,2])
#new_data3<- data.frame(hwe[9,1])

colnames(hwe) <- c("A","B","C")
subset(hwe,A == "HWE")
summary(hwe)    ##### the back up way of grabbing the numbers 

for (i in 1:nrow(hwe)){
  new_data[i]<- data.frame(hwe[i+8,1])    ##### this is the loop I'm working on
  new_data2[i]<- data.frame(hwe[i+7,2])
}  
  

