source("DownloadData")

my_data <- DownloadData()
  png(filename = "plot2.png", width = 480, height = 480, units = "px")
  plot(my_data$DateTime, my_data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off()
