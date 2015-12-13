mydfpath <- ("C:/Users/Administrator/Documents/01Data Science/001EDA/household_power_consumption.txt") ##File path"

mydfepc <- read.table(mydfpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ##read into datafile

datelimitepcdata <- mydfepc[mydfepc$Date %in% c("1/2/2007","2/2/2007"),]   ##filter for require dates

datetime <- strptime(paste(datelimitepcdata$Date, datelimitepcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Format date and time fields


subMetering1 <- as.numeric(datelimitepcdata$Sub_metering_1)  # Type casting values to numeric
subMetering2 <- as.numeric(datelimitepcdata$Sub_metering_2)  # Type casting values to numeric
subMetering3 <- as.numeric(datelimitepcdata$Sub_metering_3)  # Type casting values to numeric
 

png("plot3.png", width=480, height=480)   #open the png device file


plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")  ##create the plot and annotate


lines(datetime, subMetering2, type="l", col="red") ## Add elements



lines(datetime, subMetering3, type="l", col="blue")  ## Add elements

 
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue")) ##customize plot area

dev.off() ## Close the PNG file device
