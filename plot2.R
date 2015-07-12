plot2 <- function(data) {
      #1 import all the data
      #2 subset only the data required  dates 2007-02-01 and 2007-02-02
      #3 create the plot in the graphic display device
      #4 Copy plot to the png graphic device and save output
      
      if (missing(data)){
            data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
            data$Date <- as.Date(data$Date, "%d/%m/%Y")
            data$Datetime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
      }
      #data$Time <- strptime(data$Time, "%H:%M:%S")
      data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]
      
      x <- data$Datetime
      y <- data$Global_active_power
      plot(x, y, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
      dev.copy(png, file = "plot2.png")
      dev.off()
}