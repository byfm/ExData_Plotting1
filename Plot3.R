setwd("Z:/USER/Axel/Fortbildung/Data Analyst/R/50 Course/040 Exploratory Data Analysis/week 1/20 Programme")

filename <- "daten.zip"

## 1. Download the dataset if it does not already exist in the working directory ################################################

## Check if file exits, if not download it

if (!file.exists(filename)){
    fileURL <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
    download.file(fileURL, filename)
}  

## Check if file unziped, if not, unzip

if (!file.exists("household_power_consumption.txt"))  { 
    unzip(filename) 
} else {"Datei bereits vorhanden"}


## read and subset data

inFile <- "household_power_consumption.txt"
data <- read.table(inFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# change format
globalActivePower <- as.numeric(subSetData$Global_active_power)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

## plot data

png("plot3.png", width=960, height=960)
plot(datetime, subMetering1, type="l", ylab="Energy sub metering", xlab="")
# add lines
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
# add legend
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()