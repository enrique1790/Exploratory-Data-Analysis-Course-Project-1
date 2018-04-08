## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate 4 plots in 1 space (GAP vs. time, Vol vs. time, submetering vs. time and GRP vs. time)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

#str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
globalActivePower <- as.numeric(datasubset$Global_active_power)
globalReactivePower <- as.numeric(datasubset$Global_reactive_power)
voltage <- as.numeric(datasubset$Voltage)
subMetering1 <- as.numeric(datasubset$Sub_metering_1)
subMetering2 <- as.numeric(datasubset$Sub_metering_2)
subMetering3 <- as.numeric(datasubset$Sub_metering_3)

## plot the 4 graphs
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.5)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
