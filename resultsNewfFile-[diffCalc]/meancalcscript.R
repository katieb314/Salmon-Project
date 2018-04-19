library(readr)
pairwise <- read_table2("~/Salmon-Project/resultsNewfFile-[diffCalc]/pairwise.txt", col_names = FALSE, skip = 8)
View(pairwise)
Gst<-pairwise[76:143,1:69] #part of dataframe wanted
Gst<-sapply(Gst, as.numeric, na.rm=TRUE)
sum(Gst, na.rm=TRUE) #598.2184
mean(Gst, na.rm = TRUE)#0.2549951
range(Gst, na.rm= TRUE)#0.0096 0.6257

library(readr)
pw <- read_table2("~/Salmon-Project/resultsREGIONSNewfFile-[diffCalc]/pairwise.txt",col_names = FALSE, na = "empty", skip = 8)
View(pw)
gst<-pw[20:31,2:13]
gst<-sapply(gst, as.numeric, na.rm= TRUE)
sum(gst, na.rm=TRUE) #12.0323
mean(gst, na.rm = TRUE)#0.1542603
range(gst, na.rm= TRUE)#0.0490 0.3166