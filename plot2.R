## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a plot of global active power vs. time

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                   stringsAsFactors=FALSE, dec=".")
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))

##str(datasubset)
datetime <- strptime(paste(datasubset$Date, datasubset$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
## Plot 2
plot(datetime, datasubset$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# annotating graph
title(main="Global Active Power Vs Time")
##Saving to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()




