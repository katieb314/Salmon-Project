library(readr)
pw <- read_table2("~/Salmon-Project/resultsREGIONSNewfFile-[diffCalc]/pairwise.txt",col_names = FALSE, na = "empty", skip = 8)
View(pw)
gst<-pw[20:31,2:13]
gst<-sapply(gst, as.numeric, na.rm= TRUE)
sum(gst, na.rm=TRUE) #12.0323
mean(gst, na.rm = TRUE)#0.1542603
range(gst, na.rm= TRUE)#0.0490 0.3166