LocaData <- read.csv("mec12972-sup-0001-TableS1-S5.csv", header=T, sep=",",stringsAsFactors = T) #importing BIG dataset from github
View(LocaData) #checking it out
str(LocaData)
head(LocaData)

LocaData$Region <- LocaData$Regional.group..fine. #making this header more intuitive
head(LocaData) #checking that it worked

## First, I want to make a raster map of current temperatures

LocaData2 <- subset(LocaData, select=c(Region, Longitude, Latitude)) #making new dataset, with only the columns I need
head(LocaData2) #checking that it worked
View(LocaData2)

library(data.table) #now I want to make a dataset grouped by region, rather than by population
setDT(LocaData2)
avgLong <- LocaData2[, mean(Longitude), by = Region] #taking the mean longitude of popNs in a region
avgLat <- LocaData2[, mean(Latitude), by = Region] #taking the mean latitude of popNs in a region


install.packages("raster") #installing package to use worldclim data
library(raster) #loading it
library(sp) #loading dependency

rast <- getData("worldclim", var="bio", res=10) #making raster object, using biological variables, lowest resolution
rast <- rast[[c(1)]] #taking out only the mean annual temperature variable (taken b/w 1950-2000)
rast
names(rast) <- "CurTemp" #this is our "current temperature column


coords <- data.frame(x=LocaData2$Longitude, y=LocaData2$Latitude) #making dataframe for my lat and long

points <- SpatialPoints(coords, proj4string = rast@crs) #determining the datapoints by specifying my lat and long

values <- extract(rast, points) #extracting the mean annual temperature for those lats and longs


df <- cbind.data.frame(coordinates(points), values) #putting lat, long, and mean annual temp into a dataframe

head(df) #this dataframe includes temperatures for all specific lats and longs for all populations

df$values <- values/10 #temp is in degrees C*10, so dividing by 10 to get actual degrees C
head(df)

projection(rast)=CRS("+init=epsg:4326") #want to make sure I'm using the right coordinate system

plot(rast$CurTemp, xlim=c(-105,-50), ylim=c(40,60), 1, main="", xaxt="n", yaxt="n", legend=F)
points(cbind(LocaData2$Longitude, LocaData2$Latitude), col="#003F91FF", cex=1.5, pch=16) #plotting this on a map
#it's pretty messy with all the populations, maybe I should make the map by region

##Making another dataset to make a nice map for lats and longs of the regions, not just the individual rivers:

coords2<- data.frame(x=avgLong$V1, y=avgLat$V1)

points2<- SpatialPoints(coords2, proj4string = rast@crs)

values <- extract(rast, points2)

df2 <- cbind.data.frame(coordinates(points2), values)
head(df2)

projection(rast)=CRS("+init=epsg:4326")

#now to plot the raster map by region
plot(rast$CurTemp, xlim=c(-80,-50), ylim=c(40,65), 1, main="", legend=F, xlab="Latitude (Degrees)", ylab="Longitude (Degrees)", asp=0.75)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1.5, pch=5)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1, pch=5)

png("BIO812ProposalMap2.png") #saving it as a png so I can put it in the proposal, making slight tweaks to aesthetics
plot(rast$CurTemp, xlim=c(-80,-50), ylim=c(35,65), 1, main="", legend=F, xlab="Latitude (Degrees)", ylab="Longitude (Degrees)", asp=1.02)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1.5, pch=5)
points(cbind(avgLong$V1, avgLat$V1), col="magenta", cex=1, pch=5)
dev.off()

## Now I want to make a dataframe including lat, long, region, and temp values
#df is the dataframe containing the current temperature values
CurTemp <- df$values

#Here I am getting the future temperature data, based on 
rast2 <- getData("CMIP5", var="bio", res=10, rcp=85, model="GS", year=50) #used rcp=85 based on Sanford et al. 2014, used model=GISS based on Miao et al. 2014
rast2 <- rast2[[c(1)]]
names(rast2) <- "futTemp"
values2 <- extract(rast2, points)
View(values2)

FutTemp <- values2/10 # temperature is in degrees Celsius *10, so need to divide by 10
head(FutTemp)


# Now to try and get the past climate data:
pastClim <- read.table("pastData.txt", header=T) #Using GISS model to get past climate data from pre-industrial period (1770)
head(pastClim)

LocaData$pastTemp <- NA #making a new column in the dataset for the past data
LocaData_rounded <- LocaData
LocaData_rounded$Latitude <- ceiling(LocaData_rounded$Latitude)-0.25  
LocaData_rounded$Longitude <- ceiling(LocaData_rounded$Longitude) + 0.25 #have to round to the .75 so I can match it with the PastClim data
View(LocaData_rounded) #now ready to put into loop

#loop will take forever to run because PastClim has >250,000 rows, so I will cut out unnecessary rows (rows outside range)
range(pastClim$lat)
range(LocaData_rounded$Latitude) # only need pastClim$lat between 43.75 and 58.75

pastClim2 <- pastClim[which(pastClim$lat >= 43.75 & pastClim$lat <= 58.75), ]
nrow(pastClim2) # much better

range(pastClim2$long)
range(LocaData_rounded$Longitude) #only need pastClim$long between -70.75 and -52.75

pastClim3 <- pastClim2[which(pastClim2$long >= -70.75 & pastClim2$long <= -52.75), ]
nrow(pastClim3) #1147 rows, so should not take as long to cycle through the loop

for (i in 1:nrow(pastClim3)) { #making a loop to populate the pastTemp column with the correct temperatures
	for(j in 1:nrow(LocaData_rounded)) {
		if (LocaData_rounded[j,]$Latitude == pastClim3[i,]$lat & LocaData_rounded[j,]$Longitude == pastClim3[i,]$long) {
			LocaData_rounded[j, ]$pastTemp <- pastClim3[i,]$bio.1	
	}
	
	}
}
# YASSSS IT WORKED!!! YAYYYY!

# Now add all the climate data together!

LocaData_rounded$FutTemp <- FutTemp
LocaData_rounded$CurTemp <- CurTemp

#now turning it into a csv

write.csv(LocaData_rounded, file="ClimTrendData.csv")
