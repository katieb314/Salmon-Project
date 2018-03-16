require(ggmap)
PopRange <- c(min(LocaData$Longitude) ,
              min(LocaData$Latitude ) ,
              max(LocaData$Longitude) ,
              max(LocaData$Latitude) )
biomap <- ggmap(get_map(location=PopRange, source = "google", maptype = "satellite", zoom = 5))
biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 1)
  


