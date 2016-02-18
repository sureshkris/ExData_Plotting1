plot1 <- function()
{
  #read the text file
  plot1fulldata <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
  
  #subset the data based on date
  plot1data <- plot1fulldata[plot1fulldata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  png("plot1.png", width=480, height=480)
  
  hist(as.numeric(plot1data$Global_active_power),col="red",main = "Global Active Power" , xlab = "Global Active Power (kilowatts)")
  
  dev.off()
  
}
