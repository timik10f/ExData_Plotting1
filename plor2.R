# going to directory where data is
homeDir <- getwd()
setwd("exdata-data-household_power_consumption") # going to directory where data is
# reading data
powerConsData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE) 
setwd("..")# going back to home directory 


powerConsData$TimeDate <- as.POSIXct(paste(powerConsData$Date, powerConsData$Time), format="%d/%m/%Y %H:%M:%S") #creating date time vector - takes a long time
powerConsData$Date <- as.Date(powerConsData$Date,format="%d/%m/%Y")# converting dates to different format
# subsetting data
powerConsData <- subset(powerConsData, (powerConsData$Date == "2007-02-01"|powerConsData$Date == "2007-02-02"))

# plotting on screen
par(mfrow=c(1,1))
plot(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_active_power)),type = "n",xlab ="",ylab = "Global Active Power (kilowatts)")
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_active_power))) 

#copying to png device
dev.copy(png,'plot2.png')
dev.off()