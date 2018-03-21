require(ggmap)
LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing dataset from github
brad2014 <- read.csv("Bradbury_2014_sites.csv")
library(dplyr)
LocaData2 <- brad2014 %>% mutate(longitude = Longitude*(-1), latitude =Latitude)

# first dataset
PopRange <- c(min(LocaData$Longitude) ,
              min(LocaData$Latitude ) ,
              max(LocaData$Longitude) ,
              max(LocaData$Latitude) )
biomap <- ggmap(get_map(location=PopRange, source = "google", maptype = "satellite", zoom = 5))
biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 0.8)
  geom_point(aes(x= Longitude, y= Latitude, data=LocaData2, color= "red", size=2, alpha=0.8))
  
  # second dataset
  PopRange2 <- c(min(LocaData2$longitude) +2,
                min(LocaData2$latitude ) +2,
                max(LocaData2$longitude) +2,
                max(LocaData2$latitude) +2)
  
  biomap <- ggmap(get_map(location=PopRange2, source = "google", maptype = "satellite", zoom = 5))
  biomap+
    geom_point(aes(x = longitude, y= latitude) , data= LocaData2, color = "red", size = 4, alpha= 1)+
    geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 1, alpha= 1)

