mydfpath <- ("C:/Users/Administrator/Documents/01Data Science/001EDA/household_power_consumption.txt") ##File path"

mydfepc <- read.table(mydfpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ##read into datafile

datelimitepcdata <- mydfepc[mydfepc$Date %in% c("1/2/2007","2/2/2007"),]   ##filter for require dates
 
gap<- as.numeric(datelimitepcdata$Global_active_power)  ##type caste as numeric

png("plot1.png", width=480, height=480)   ##create png file device and size the image

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") ##plot histogram, and customise title and x axis label

dev.off() ## Close the PNG file device
