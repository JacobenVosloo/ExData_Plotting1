plot3 <- function(data) {
      #1 import all the data
      #2 subset only the data required  dates 2007-02-01 and 2007-02-02
      #3 create the plot in the graphic display device
      #4 Copy plot to the png graphic device and save output
      
      if (missing(data)){
            data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
            data$Date <- as.Date(data$Date, "%d/%m/%Y")
            data$Datetime = as.POSIXct(paste(data$Date, data$Time), format="%Y-%m-%d %H:%M:%S")
      }
      #2 Subset the data
      data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]
      
      #3
      par(mfrow = c(1,1))
      x <- data$Datetime
      y1 <- data$Sub_metering_1
      y2 <- data$Sub_metering_2
      y3 <- data$Sub_metering_3
      plot(x, y1, type="l", xlab = "", ylab = "Energy sub metering", col = "black")
      lines(x, y2, type="l", xlab = "", ylab = "Energy sub metering", col = "red")
      lines(x, y3, type="l", xlab = "", ylab = "Energy sub metering", col = "blue")
      legend("topright", pch = "-", col = c("black", "red", "blue"), 
            legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
      dev.copy(png, file = "plot3.png",width = 480, height = 480)
      dev.off()
}