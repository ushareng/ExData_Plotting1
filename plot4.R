plot4 <- function() {
        ## The function reads the household_power_consumption.txt file
        ## and subsets the data taken from 2 days: 2007-02-01 and 2007-02-02
		## and generates four plots in 1 space (GAP vs. Time, Vol vs. Time, Submetering vs. Time and GRP vs. Time)
		
		dataFile <- "./data/household_power_consumption.txt"
		data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
		subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

		datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
		gActivePower <- as.numeric(subsetData$Global_active_power)
		globalReactivePower <- as.numeric(subsetData$Global_reactive_power)
		voltage <- as.numeric(subsetData$Voltage)
		subMetering1 <- as.numeric(subsetData$Sub_metering_1)
		subMetering2 <- as.numeric(subsetData$Sub_metering_2)
		subMetering3 <- as.numeric(subsetData$Sub_metering_3)


		png("plot4.png", width=480, height=480)
		par(mfrow = c(2, 2)) 

		plot(datetime, gActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

		plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

		plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
		lines(datetime, subMetering2, type="l", col="red")
		lines(datetime, subMetering3, type="l", col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

		plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

		dev.off()
        
      
}