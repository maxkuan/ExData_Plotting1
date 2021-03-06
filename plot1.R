plot1<-function(file){
##
## argument 'file' is the full path to the input data file
##
	library(datasets) 

	## Read in the table
	data <- read.table(file, sep=";", header=TRUE, na.strings = "?")

	## Subsetting to get data between 2007-02-01 and 2007-02-02
	data2<-data[data$Date == "1/2/2007" | data$Date =="2/2/2007",]

	## Create histogram on screen device
	hist(data2$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)") 

	## Copy the plot to PNG device
	dev.copy(png, file = "plot1.png", width=480, height=480) 

	## Close the PNG
	dev.off() 
}