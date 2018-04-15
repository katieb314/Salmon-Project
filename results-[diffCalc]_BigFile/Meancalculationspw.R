pairwise<-read_table2("results-[diffCalc]_BigFile/pairwise.txt", col_names = FALSE, skip=1)
df<-pairwise[169:320,] #make dataframe with only Gst values wanted 
### was difficult to work with, reloaded data in different table below 


               
Df<-read_table2("results-[diffCalc]_BigFile/pairwise.txt",na = "empty", skip = 160)

summary(Df)#have to see what class it is, need numerics. 
View(Df[8:159,]) #view to verify all values accounted for
Data<-Df[8:159,]
View(Data)
pw<-sapply(Data, as.numeric, na.rm=TRUE)
View(pw)
sum(pw, na.rm=TRUE)
mean(pw, na.rm = TRUE)
range(pw, na.rm = TRUE) ##[1] -0.0248  0.7458 is it okay to have negative values ??

