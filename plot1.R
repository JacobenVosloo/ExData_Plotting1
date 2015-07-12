plot1 <- function(x) {
      #1 import all the data
      #2 subset only the data required  dates 2007-02-01 and 2007-02-02
      #3 create the plot in the graphic display device
      #4 Copy plot to the png graphic device and save output
      
      if (missing(x)){
            data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
            data$Date <- as.Date(data$Date, "%d/%m/%Y")
      }
      #2 Subset the data
      data <- data[which(data$Date == as.Date("2007-02-01") | data$Date == as.Date("2007-02-02")), ]
      
      #3 Create graphs
      par(mfrow = c(1,1))
      hist(data$Global_active_power, col = "red", main ="Global Active Power", xlab = "Global Active Power (kilowatts)", 
           ylab = "Frequency")
      dev.copy(png, file = "plot1.png",width = 480, height = 480)
      dev.off()
}