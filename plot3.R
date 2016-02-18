plot3 <- function()
{
  #read the text file
  plot3fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #subset the data based on date
  plot3data <- plot3fulldata[plot3fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  #get and format the Date variable
  datetime <- strptime(paste(plot3data$Date, plot3data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  
  #get and format the energy sub meter variable
  energysubmeter1 <- as.numeric(plot3data$Sub_metering_1)
  energysubmeter2 <- as.numeric(plot3data$Sub_metering_2)
  energysubmeter3 <- as.numeric(plot3data$Sub_metering_3)
  
  
  #define the name and dimension of the png file
  png("plot3.png", width=480, height=480)
  
  plot(datetime,energysubmeter1,type="l",xlab="",ylab = "Energy sub metering")
  lines(datetime,energysubmeter2,type="l",col="red")
  lines(datetime,energysubmeter3,type="l",col="blue")
  
  #define the legend
  legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

  dev.off()
  
  
}
