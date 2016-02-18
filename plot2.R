plot2 <- function()
{
  #read the text file
  plot2fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #subset the data based on date
  plot2data <- plot2fulldata[plot2fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  datetime <- strptime(paste(plot2data$Date, plot2data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
  
  GlobalActivePower <- as.numeric(plot2data$Global_active_power)
  
  png("plot2.png", width=480, height=480)
  
  plot(datetime,GlobalActivePower,type="l",xlab="",ylab = "Global Active Power (kilowatts)")
  
  dev.off()
  
}
