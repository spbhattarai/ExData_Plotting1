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
globalActivePower <- as.numeric(subSetData$Global_active_power)
png("plot1.png", width=480, height=480)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()