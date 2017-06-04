## This R script is to plot the day/time wise plot of Energy Sub Metering (Plot 3 of Assignment)

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

twodaydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
twodaydata$Sub_metering_1 <- as.numeric(twodaydata$Sub_metering_1)
twodaydata$Sub_metering_2 <- as.numeric(twodaydata$Sub_metering_2)
twodaydata$Sub_metering_3 <- as.numeric(twodaydata$Sub_metering_3)
datetime <- strptime(paste(twodaydata$Date, twodaydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

plot(datetime, twodaydata$Sub_metering_1, type =  "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, twodaydata$Sub_metering_2, col = "red")
lines(datetime, twodaydata$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()