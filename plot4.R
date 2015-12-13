mydfpath <- ("C:/Users/Administrator/Documents/01Data Science/001EDA/household_power_consumption.txt") ##File path"

mydfepc <- read.table(mydfpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ##read into datafile

datelimitepcdata <- mydfepc[mydfepc$Date %in% c("1/2/2007","2/2/2007"),]   ##filter for require dates

datetime <- strptime(paste(datelimitepcdata$Date, datelimitepcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Format date and time fields

##type caste variables 
gap <- as.numeric(datelimitepcdata$Global_active_power) 
grp <- as.numeric(datelimitepcdata$Global_reactive_power) 
voltage <- as.numeric(datelimitepcdata$Voltage) 
subMetering1 <- as.numeric(datelimitepcdata$Sub_metering_1) 
subMetering2 <- as.numeric(datelimitepcdata$Sub_metering_2) 
subMetering3 <- as.numeric(datelimitepcdata$Sub_metering_3) 


## open png file device
png("plot4.png", width=480, height=480) 

## set print area for multirow charts
par(mfrow = c(2, 2))  

##plot the charts and add elements
plot(datetime, gap, type="l", xlab="", ylab="Global Active Power", cex=0.2) 


plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage") 
 

plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="") 


lines(datetime, subMetering2, type="l", col="red") 
lines(datetime, subMetering3, type="l", col="blue") 

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o") 


plot(datetime, grp, type="l", xlab="datetime", ylab="Global_reactive_power") 
 
## Close the PNG file device

dev.off()  
