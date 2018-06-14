plot3 <- function(){
        ## The function reads the household_power_consumption.txt file
        ## and subsets the data taken from 2 days: 2007-02-01 and 2007-02-02
        ## and generates a plot of different Sub_metering vs Time
        
        dataFile <- "./data/household_power_consumption.txt"
        data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
        subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]


		datetime <- strptime(paste(subsetData$Date, subsetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
		gActivePower <- as.numeric(subsetData$Global_active_power)
		subMetering1 <- as.numeric(subsetData$Sub_metering_1)
		subMetering2 <- as.numeric(subsetData$Sub_metering_2)
		subMetering3 <- as.numeric(subsetData$Sub_metering_3)

		png("plot3.png", width=480, height=480)
		plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
		lines(datetime, subMetering2, type="l", col="red")
		lines(datetime, subMetering3, type="l", col="blue")
		legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
		dev.off()
}