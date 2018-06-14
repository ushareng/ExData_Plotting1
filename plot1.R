plot1<- function(){
        ## The function reads the household_power_consumption.txt file
        ## and subsets the data taken from 2 days: 2007-02-01 and 2007-02-02
        ## and generates a histogram of global active power(kilowatts)      
		        
		dataFile <- "./data/household_power_consumption.txt"
		data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
		subsetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]
        
        gActivePower <- as.numeric(subsetData$Global_active_power)
	    png("plot1.png", width=480, height=480)
        hist(gActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
}
