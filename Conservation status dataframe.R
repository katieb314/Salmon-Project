colnames(NFLD)<-c("River", "Latitude", "Longitude", "SARA", "COSEWIC") # added two columns to K dataframe

status<-data.frame(SARA = "No status", COSEWIC = "Threatened") #new data frame of status to eventually bind with NFLD


status<-data.frame(SARA = rep(c("No status"), times= 33), COSEWIC= rep(c("Threatened"), times=33)) #repeats 33 rows 
status1<-data.frame(SARA = rep(c("No status"), times= 13), COSEWIC= rep(c("No status"), times=13)) #needed to make a new dataframe because the next 13 have different COSEWIC status
status2<-data.frame(SARA = rep(c("No status"), times= 2), COSEWIC= rep(c("Threatened"), times=2)) #for row 47 and 48 different COSEWIC status threatened 
status3<-data.frame(SARA = rep(c("No status"), times= 18), COSEWIC= rep(c("No status"), times=18))# 49 to 66 no status 
status4<-data.frame(SARA = rep(c("No status")), COSEWIC= rep(c("Threatened"))) #67 COSEWIC threatened
status5<-data.frame(SARA = rep(c("No status"), times= 3), COSEWIC= rep(c("No status"), times= 3))## 68-70
status6<-data.frame(SARA = rep(c("No status")), COSEWIC= rep(c("Threatened")))## 71
status7<-data.frame(SARA = rep(c("No status")), COSEWIC= rep(c("No status"))) ##72
status8<-data.frame(SARA = rep(c("No status")), COSEWIC= rep(c("Threatened"))) ##73

df<-rbind(status, status1, status2, status3, status4, status5, status6, status7, status8) #bind the data frames so it is one dataframe on 73 obs.
CONstat<-cbind(NFLD, df) #bind conservation status data frame with NFLD
CONstat<-CONstat[-c(4:18)] #drop unnecessary columns to have complete dataframe