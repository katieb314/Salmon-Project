LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing dataset from github
View(LocaData) #checking it out
str(LocaData)
head(LocaData)

LocaData$Region <- LocaData$Regional.group..fine. #making this header more intuitive
head(LocaData) #checking that it worked

LocaData2 <- subset(LocaData, select=c(Region, Longitude, Latitude)) #making new dataset with the columns I want
head(LocaData2) #checking that it worked
View(LocaData2)

library(data.table)
setDT(LocaData2)
avgLong <- LocaData2[, mean(Longitude), by = Region]
avgLat <- LocaData2[, mean(Latitude), by = Region]


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

#Making another dataset for lats and longs of the regions, not just the individual rivers:

coords2<- data.frame(x=avgLong$V1, y=avgLat$V1)

points2<- SpatialPoints(coords2, proj4string = rast@crs)

values <- extract(rast, points2)

df2 <- cbind.data.frame(coordinates(points2), values)
head(df2)

projection(rast)=CRS("+init=epsg:4326")

plot(rast$CurTemp, xlim=c(-80,-50), ylim=c(40,65), 1, main="", legend=F, xlab="Latitude (Degrees)", ylab="Longitude (Degrees)", asp=0.75)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1.5, pch=5)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1, pch=5)

png("BIO812ProposalMap2.png")
plot(rast$CurTemp, xlim=c(-80,-50), ylim=c(35,65), 1, main="", legend=F, xlab="Latitude (Degrees)", ylab="Longitude (Degrees)", asp=1.02)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1.5, pch=5)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1, pch=5)
dev.off()

#now I want to make a dataframe including lat, long, region, and temp values
curtemp_df <- cbind.data.frame(df2, avgLat$Region)

pop_df <- cbind.data.frame(df, LocaData$Name)
head(pop_df)


rast2 <- getData("CMIP5", var="bio", res=10, rcp=85, model="BC", year=50) #used rcp=85 based on Sanford et al. 2014, used model=BC based on Miao et al. 2014
rast2 <- rast2[[c(1)]]
names(rast2) <- "futTemp"
values2 <- extract(rast2, points)
View(values2)

futcurtemp_df <-cbind.data.frame(curtemp_df, values2)

# Now to try and get the past climate data:
pastClim <- read.table("pastData.txt", header=T) #Using GISS model to get past climate data from pre-industrial period (1770)
head(pastClim)
install.packages("dplyr") #need to only extract the rows with the lat/long and variable that we want
library(dplyr)
install.packages("bindrcpp")
pastTemp <- filter(pastClim, lat == LocaData$latitude & long == LocaData$Longitude, bio.1)

LocaData$pastTemp <- NA

for (i in 1:nrow(LocaData)) {
	if (LocaData$Latitude == pastClim$lat & LocaData$Longitude == pastClim$long) {
		LocaData$pastTemp[i] <- pastClim$bio.1
	}
}

rast3 <- getData("worldclim", var="bio", res=10) #making raster object, using biological variables, lowest resolution
rast3 <- rast3[[c("mb1")]] #taking out only the mean annual temperature variable (taken b/w 1950-2000)
rast3
names(rast3) <- "pastTemp"

install.packages("sdmpredictors")
library(sdmpredictors)
