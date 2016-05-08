# Reproducible Research: Peer Assessment 1

# Basic settings

echo = TRUE  # Always make code visible

options(scipen = 1)  # Turn off scientific notations for numbers

# Loading and preprocessing the data
setwd('F:/DataScientist/R/exdata_data_household_power_consumption')

if (!file.exists("household_power_consumption.txt")) 
{
  unzip("exdata-data-household_power_consumption.zip")
}

dataFile <- "./household_power_consumption.txt"
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()