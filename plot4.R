plot4 <- function()
{
  
  #read the text file
  plot4fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #subset the data based on date
  plot4data <- plot4fulldata[plot3fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  png("plot4.png", width=480, height=480)
  
  
  #split the display area
  par(mfrow=c(2, 2))
  
  
  datetime <- strptime(paste(plot4data$Date, plot4data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  #top left plot
  GlobalActivePower <- as.numeric(plot4data$Global_active_power)
  plot(datetime,GlobalActivePower,type="l",xlab="",ylab = "Global Active Power")
  
  
  #Voltage plot
  Voltage <- as.numeric(plot4data$Voltage)
  plot(datetime,Voltage,type="l",xlab="datetime",ylab = "Voltage")
  
  
  #down left plot
  energysubmeter1 <- as.numeric(plot4data$Sub_metering_1)
  energysubmeter2 <- as.numeric(plot4data$Sub_metering_2)
  energysubmeter3 <- as.numeric(plot4data$Sub_metering_3)
  
  plot(datetime,energysubmeter1,type="l",xlab="",ylab = "Energy sub metering")
  lines(datetime,energysubmeter2,type="l",col="red")
  lines(datetime,energysubmeter3,type="l",col="blue")
  
  
  
  #down right plot
  GlobalReactivePower <- as.numeric(plot4data$Global_reactive_power)
  plot(datetime,GlobalActivePower,type="l",xlab="datetime",ylab = "Global Reactive Power")
  
  dev.off()
  
}
