## Plot3.R code file

## Read in the data
PowerDataClasses <- read.table("household_power_consumption.txt",header = TRUE, nrows = 5,sep=";")
classes <- sapply(PowerDataClasses, class)
PowerData <- read.table("household_power_consumption.txt",header = TRUE, nrows = 2075259,sep=";", colClasses = classes, na.strings = c("?"))
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")
twoDay <- subset(PowerData, PowerData$Date >="2007-02-01" & PowerData$Date <="2007-02-02")

## Construct the plot
png('plot3.png', width = 480, height = 480)
dateTime <- as.POSIXct(paste(twoDay$Date, twoDay$Time), format="%Y-%m-%d %H:%M:%S")
plot(dateTime,twoDay$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(dateTime, twoDay$Sub_metering_2, col = "red")
lines(dateTime, twoDay$Sub_metering_3, col = "blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1))
dev.off()