plot2<-function(file){
##
## argument 'file' is the full path to the input data file
##
	library(datasets) 

	## Read in the table
	data <- read.table(file, sep=";", header=TRUE, na.strings = "?")

	## Subsetting to get data between 2007-02-01 and 2007-02-02
	data2<-data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]

	## Convert DATE and TIME variables 
	DT <- strptime(paste(data2[,"Date"], data2[,"Time"]), "%d/%m/%Y %H:%M:%S")

	## Create plot on screen device
	plot(DT, data2$Global_active_power, type="n", xlab="", ylab="Global Active Power (kilowatts)")
	lines(DT, data2$Global_active_power, type="l")

	## Copy the plot to PNG device
	dev.copy(png, file = "plot2.png", width=480, height=480) 

	## Close the PNG
	dev.off() 
}
