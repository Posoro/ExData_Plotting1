mydfpath <- ("C:/Users/Administrator/Documents/01Data Science/001EDA/household_power_consumption.txt") ##File path"

mydfepc <- read.table(mydfpath, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".") ##read into datafile

datelimitepcdata <- mydfepc[mydfepc$Date %in% c("1/2/2007","2/2/2007"),]   ##filter for require dates

datetime <- strptime(paste(datelimitepcdata$Date, datelimitepcdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") ## Format date and time fields

gap<- as.numeric(datelimitepcdata$Global_active_power)  ##type caste as numeri

png("plot2.png", width=480, height=480) ##open png file device

plot(datetime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)") ##plot and annotate graph

dev.off() ## Close the PNG file device
