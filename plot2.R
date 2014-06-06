## Plot2.R 
library(data.table)

##Load data between date 2007-2-1 and 2007-2-2
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)[Date=="1/2/2007"|Date=="2/2/2007"]

## Data transform
x <- paste(data$Date, data$Time)
x <- strptime(x, "%d/%m/%Y %H:%M:%S")

##plot
##hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowalt)", cex.axis = 0.8, cex.lab = 0.9)
png(file = "plot2.png", bg = "transparent", width = 480, height = 480)
plot(x, data$Global_active_power, type= "n", xlab = " ", ylab = "Global Active Power(kilowalt)", cex.axis = 0.8, cex.lab = 0.9)
lines(x, data$Global_active_power)

dev.off()
