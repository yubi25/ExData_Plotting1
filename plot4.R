source("DownloadData")

my_data <- DownloadData()
  png(filename = "plot4.png", width = 480, height = 480, units = "px") 
  par (mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))

  with(my_data, {
    plot(my_data$DateTime, Global_active_power, xlab="", ylab="Global Active Power", type="l")
    plot(my_data$DateTime, Voltage, xlab="datetime", ylab="Voltage", type="l")
    
    cols = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
    plot(my_data$DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
    lines(my_data$DateTime, Sub_metering_2, type="l", col="red")
    lines(my_data$DateTime, Sub_metering_3, type="l", col="blue")
    legend("topright", lty=1, lwd=1, col=c("black","blue","red"), legend=cols, bty="n")
    
    plot(my_data$DateTime, Global_reactive_power, xlab="datetime", ylab="Global_reactive_power", type="l")        
  })    
  dev.off()
