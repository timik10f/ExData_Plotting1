homeDir <- getwd()
setwd("exdata-data-household_power_consumption") # going to directory where data is
# reading data
powerConsData <- read.table("household_power_consumption.txt",sep = ";",header = TRUE) 
setwd("..") # going back to home directory 


powerConsData$TimeDate <- as.POSIXct(paste(powerConsData$Date, powerConsData$Time), format="%d/%m/%Y %H:%M:%S") #creating date time vector - takes a long time!
powerConsData$Date <- as.Date(powerConsData$Date,format="%d/%m/%Y") # converting dates to different format
powerConsData <- subset(powerConsData, (powerConsData$Date == "2007-02-01"|powerConsData$Date == "2007-02-02"))# subsetting data


png('plot4.png')

# setting 4 plots in 1 figure
par(mfcol=c(2,2))


# plot 1
plot(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_active_power)),type = "n",xlab ="",ylab = "Global Active Power")
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_active_power))) 

# plot 2
plot(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Sub_metering_1)),type = "n",xlab ="",ylab = "Energy sub metering")
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Sub_metering_1))) 
par(new=T)
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Sub_metering_2)), col = "red") 
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Sub_metering_3)), col = "blue") 
par(new=F)
par(cex = 0.8)
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),col=c("black","red","blue"),bty = "n")
par(cex = 1)
#plot 3
plot(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Voltage)),type = "n",xlab ="datetime",ylab = "Voltage")
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Voltage))) 

#plot 4
plot(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_reactive_power)),type = "n",xlab ="datetime",ylab = "Global_reactive_power")
lines(powerConsData$TimeDate, as.numeric(as.character(powerConsData$Global_reactive_power))) 


dev.off()


