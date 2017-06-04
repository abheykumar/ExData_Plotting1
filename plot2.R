## This R script is to plot the day/time wise plot of Global Active Power (Plot 2 of Assignment)

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

twodaydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
twodaydata$Global_active_power <- as.numeric(twodaydata$Global_active_power)
datetime <- strptime(paste(twodaydata$Date, twodaydata$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

png("plot2.png", width = 480, height = 480)

plot(datetime, twodaydata$Global_active_power, type =  "l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()