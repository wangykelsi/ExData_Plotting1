## Plot3.R 
library(data.table)

##Load data between date 2007-2-1 and 2007-2-2
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)[Date=="1/2/2007"|Date=="2/2/2007"]

## Data transform
x <- paste(data$Date, data$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

##plot
png(file = "plot3.png", bg = "transparent", width = 480, height = 480)
plot(x, data$Sub_metering_1, type= "l", xlab = " ", ylab = "Energy sub metering", cex.axis = 0.8, cex.lab = 0.9)
lines(x, data$Sub_metering_2, col = "red")
lines(x, data$Sub_metering_3, col = "blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)

dev.off()
