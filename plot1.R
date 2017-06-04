## This R script is to plot the frequency plot of Global Active Power (Plot 1 of Assignment)

data <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", stringsAsFactors = FALSE)

twodaydata <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]
plotdata <- as.numeric(twodaydata$Global_active_power, na.rm=TRUE)

png("plot1.png", width = 480, height = 480)

hist(plotdata, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off()