LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing dataset from github
View(LocaData) #checking it out
str(LocaData)
head(LocaData)

LocaData$Region <- LocaData$Regional.group..fine. #making this header more intuitive
head(LocaData) #checking that it worked

LocaData2 <- subset(LocaData, select=c(Region, Longitude, Latitude)) #making new dataset with the columns I want
head(LocaData2) #checking that it worked
View(LocaData2)



install.packages("raster") #installing package to use worldclim data
library(raster) #loading it
library(sp) #loading dependency

rast <- getData("worldclim", var="bio", res=10) #making raster object, using biological variables, lowest resolution
rast <- rast[[c(1)]] #taking out only the mean annual temperature variable (taken b/w 1950-2000)
rast
names(rast) <- "CurTemp"

coords <- data.frame(x=LocaData2$Longitude, y=LocaData2$Latitude) #making dataframe for my lat and long

points <- SpatialPoints(coords, proj4string = rast@crs) #determining the datapoints by specifying my lat and long

values <- extract(rast, points) #extracting the mean annual temperature for those lats and longs


df <- cbind.data.frame(coordinates(points), values) #putting lat, long, and mean annual temp into a dataframe

head(df)

df$values <- values/10 #temp is in degrees C*10, so dividing by 10 to get actual degrees C
head(df)

plot(rast$CurTemp, xlim=c(-105,-50), ylim=c(40,60), 1, main="", xaxt="n", yaxt="n", legend=F)
points(cbind(LocaData2$Longitude, LocaData2$Latitude), col="#003F91FF", cex=1.5, pch=16)
