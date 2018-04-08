## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a plot of different submetering vs time

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
subMetering1 <- as.numeric(datasubset$Sub_metering_1)
subMetering2 <- as.numeric(datasubset$Sub_metering_2)
subMetering3 <- as.numeric(datasubset$Sub_metering_3)
## Plot 3
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
# annotating graph
title(main="Energy sub-metering")
##Saving to file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()

