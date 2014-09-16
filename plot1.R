## Plot1.R code file

## Read in the data
PowerDataClasses <- read.table("household_power_consumption.txt",header = TRUE, nrows = 5,sep=";")
classes <- sapply(PowerDataClasses, class)
PowerData <- read.table("household_power_consumption.txt",header = TRUE, nrows = 2075259,sep=";", colClasses = classes, na.strings = c("?"))
PowerData$Date <- as.Date(PowerData$Date, format = "%d/%m/%Y")
twoDay <- subset(PowerData, PowerData$Date >="2007-02-01" & PowerData$Date <="2007-02-02")

## Construct the plot
png('plot1.png', width = 480, height = 480)
hist(twoDay$Global_active_power, col = "red",xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()