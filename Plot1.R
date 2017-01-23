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

## read and subset  data

inFile <- "household_power_consumption.txt"
data <- read.table(inFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
# change to nummeric
globalActivePower <- as.numeric(subSetData$Global_active_power)

## Plot data

png("plot1.png", width=960, height=960)
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()