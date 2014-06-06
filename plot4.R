## Plot4.R 
library(data.table)

##Load data between date 2007-2-1 and 2007-2-2
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)[Date=="1/2/2007"|Date=="2/2/2007"]

## Data transform
x <- paste(data$Date, data$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

##plot
png(file = "plot4.png", bg = "transparent", width = 480, height = 480)
par(mfrow = c(2,2))
par(mar = c(4,4,2,1))
##subplot1
plot(x, data$Global_active_power, type= "l", xlab = " ", ylab = "Global Active Power", cex.axis = 0.7, cex.lab = 0.9)

##subplot2
plot(x, data$Voltage, type= "l", xlab = "datetime", ylab = "Voltage", cex.axis = 0.7, cex.lab = 0.9)

##subplot3
plot(x, data$Sub_metering_1, type= "l", xlab = " ", ylab = "Energy sub metering", cex.axis = 0.7, cex.lab = 0.9)
lines(x, data$Sub_metering_2, col = "red")
lines(x, data$Sub_metering_3, col = "blue")
legend("topright", bty = "n", col=c("black", "red", "blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lwd = 1)

##subplot4
plot(x, data$Global_reactive_power, type= "l", xlab = "datetime", ylab = "Global_reactive_power", cex.axis = 0.7, cex.lab = 0.9)

## Save to a png file
##dev.copy(png, file = "plot4.png", 480, 480)
dev.off()
