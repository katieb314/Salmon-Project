require(ggmap)
LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing dataset from github

# create the range for Google maps to make a basemap for our salmon sites
PopRange <- c(min(LocaData$Longitude) ,
              min(LocaData$Latitude ) ,
              max(LocaData$Longitude) ,
              max(LocaData$Latitude) )
# create the basemap and store it in r as a object using google's satellite
biomap <- ggmap(get_map(location=PopRange, source = "google", maptype = "satellite", zoom = 5))
# populate our map with our sampling sites
biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 1)

<<<<<<< HEAD
# lets map the samples that Kurtis has now created lat long for.
  
NFLDpops<- read.csv("NFLD rivers lat longCSV.csv")
head(NFLDpops)

###-----------------------------
# Add both data sets onto one map
###-----------------------------

biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 1)+
  geom_point(aes(x = Longitude, y= Latitude) , data= NFLDpops, color = "yellow", size = 2, alpha= 1)

###-----------------------------
# Add an Inset Map in top right corner
###-----------------------------

map2 <- ggmap(get_map(location= "Canada", source = "google", maptype = "hybrid", zoom = 3))

# verison 1
p1 <-biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 1)+
  geom_point(aes(x = Longitude, y= Latitude) , data= NFLDpops, color = "yellow", size = 2, alpha= 1)

g1 <- ggplotGrob(p1)
grid.draw(g1)
pushViewport( viewport(x=0.8, y=0.8, w=.3, h=.3) )
xy <- data.frame(x=c(-54.00,-54.00,-48.00,-48.00,-54.00), 
                 y=c(70,54.75,54.75,60,60))
p2 <- (map2) 
g2 <- ggplotGrob(p2)
grid.draw(g2)
grid.rect(map2 )
popViewport()


# version 2
# this version is not working
biomap+
  geom_point(aes(x = Longitude, y= Latitude) , data= LocaData, color = "yellow", size = 2, alpha= 1)+
  geom_point(aes(x = Longitude, y= Latitude) , data= NFLDpops, color = "yellow", size = 2, alpha= 1)+
  inset_ggmap(biomap) # this is not working but online tutorial says this is it so i dooonnno

??inset_ggmap
# version 3
grid.newpage()
v1<-viewport(width = 1, height = 1, x = 0.5, y = 0.5) #plot area for the main map
v2<-viewport(width = 0.3, height = 0.3, x = 0.75, y = 0.8) #plot area for the inset map
print(p1,vp=v1) 
print(map2 + xlab("")+ ylab("")  ,vp=v2)


=======
# try and add labells??
  geom_text(aes(x = Longitude, y= Latitude), label=LocaData$Name, data= LocaData)
 
            
>>>>>>> e1393a2aac1916824a4cf79f658317b6abde287f
