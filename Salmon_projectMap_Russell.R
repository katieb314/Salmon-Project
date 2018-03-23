require(ggmap)
LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing dataset from github

library(dplyr)

# create the range for Google maps to make a basemap for our salmon sites
PopRange <- c(min(LocaData$Longitude) ,
              min(LocaData$Latitude ) ,
              max(LocaData$Longitude) ,
              max(LocaData$Latitude) )
# create the basemap and store it in r as a object using google's satellite
biomap <- ggmap(get_map(location=PopRange, source = "google", maptype = "satellite", zoom = 5))
# populate our map with our sampling sites
biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 0.8)

# try and add labells??
  geom_text(aes(x = Longitude, y= Latitude), label=LocaData$Name, data= LocaData)
 
            