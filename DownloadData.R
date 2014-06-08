DownloadData <- function() {
  cleanFile <- "exploratory_data_project1.csv"
  if(file.exists(cleanFile)) {
    my_data <- read.csv(cleanFile)
    my_data$DateTime <- strptime(my_data$DateTime, "%Y-%m-%d %H:%M:%S")
  return(my_data)
  }
  else {
    my_file <- download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile="household_power_consumption.zip", method="wget")
    dateDownloaded <- date()
    my_data <- read.table(unz(my_file, "household_power_consumption.txt", open="rt"), header=T, sep=';', na.strings="?", colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
    my_data <- my_data[(my_data$Date == "1/2/2007") | (my_data$Date == "2/2/2007"),]
    my_data$DateTime <- strptime(paste(my_data$Date, my_data$Time), "%d/%m/%Y %H:%M:%S")
    write.csv(my_data, cleanFile)
  }
}