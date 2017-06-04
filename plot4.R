## This R script is to plot the Plot 4 of Assignment

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

twodaydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
twodaydata$Global_active_power <- as.numeric(twodaydata$Global_active_power)
twodaydata$Global_reactive_power <- as.numeric(twodaydata$Global_reactive_power)
twodaydata$Voltage <- as.numeric(twodaydata$Voltage)
twodaydata$Sub_metering_1 <- as.numeric(twodaydata$Sub_metering_1)
twodaydata$Sub_metering_2 <- as.numeric(twodaydata$Sub_metering_2)
twodaydata$Sub_metering_3 <- as.numeric(twodaydata$Sub_metering_3)
datetime <- strptime(paste(twodaydata$Date, twodaydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2,2))

plot(datetime, twodaydata$Global_active_power, type =  "l", xlab = "", ylab = "Global Active Power")

plot (datetime, twodaydata$Voltage, type = "l", ylab = "Voltage")

plot(datetime, twodaydata$Sub_metering_1, type =  "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, twodaydata$Sub_metering_2, col = "red")
lines(datetime, twodaydata$Sub_metering_3, col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, box.lty=0, col=c("black", "red", "blue"))

plot(datetime, twodaydata$Global_reactive_power, type =  "l", ylab = "Global_reactive_power")

dev.off()