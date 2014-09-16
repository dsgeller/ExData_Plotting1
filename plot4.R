## Plot4.R code file

## Read in the data
PowerDataClasses <- read.table("household_power_consumption.txt",header = TRUE, nrows = 5,sep=";")
classes <- sapply(PowerDataClasses, class)
PowerData <- read.table("household_power_consumption.txt",header = TRUE, nrows = 2075259,sep=";", colClasses = classes, na.strings = c("?"))
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")
twoDay <- subset(PowerData, PowerData$Date >="2007-02-01" & PowerData$Date <="2007-02-02")

## Construct the plots
png('plot4.png', width = 480, height = 480)
datetime <- as.POSIXct(paste(twoDay$Date, twoDay$Time), format="%Y-%m-%d %H:%M:%S")
par(mfrow = c(2,2))
## Plot 1:  Global Active Power 
plot(datetime,twoDay$Global_active_power, type = "l", xlab="", ylab = "Global Active Power")
## Plot 2:  Voltage
plot(datetime,twoDay$Voltage, type = "l", ylab = "Voltage")
## Plot 3:  Energy sub metering
plot(datetime,twoDay$Sub_metering_1, type = "l", xlab="", ylab = "Energy sub metering")
lines(datetime, twoDay$Sub_metering_2, col = "red")
lines(datetime, twoDay$Sub_metering_3, col = "blue")
legend("topright", col= c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=c(1,1))
## Plot 4:  Global Reactive Power
plot(datetime,twoDay$Global_reactive_power, type = "l",ylab="Global_reactive_power")

dev.off()