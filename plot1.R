## 1. read the household_power_consumption.txt file
## 2. subset for data taken from 2 days: 2007-02-01 and 2007-02-02
## 3. generate a histogram of global active power(kilowatts)

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", 
                    stringsAsFactors=FALSE, dec=".")
                    
datasubset <- subset(data, Date %in% c("1/2/2007","2/2/2007"))
#str(datasubset)
datasubset$Global_active_power <- as.numeric(datasubset$Global_active_power)
#plot 1
hist(datasubset$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")
##Saving to file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()

