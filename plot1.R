homeDir <- getwd()
setwd("exdata-data-household_power_consumption") # going to directory where data is

# reading data
powerConsData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE) 
setwd("..") # going back to home directory 
powerConsData$Date <- as.Date(powerConsData$Date,format="%d/%m/%Y") # converting dates to different format
powerConsData <- subset(powerConsData, (powerConsData$Date == "2007-02-01"|powerConsData$Date == "2007-02-02")) # subsetting data

#plotting on screen
par(mfrow=c(1,1))
hist(as.numeric(as.character(powerConsData$Global_active_power)), col = "red",  xlab = "Global Active Power (kilowatts)", ylab = "Frequency", main = "Global Active Power")
#copying to png device
dev.copy(png,'plot1.png')
dev.off()