## Plot1.R 
library(data.table)

##Load data between date 2007-2-1 and 2007-2-2
data <- fread("household_power_consumption.txt", sep = ";", na.strings = "?", header = TRUE)[Date=="1/2/2007"|Date=="2/2/2007"]

## Covert Global_active_power to num
data$Global_active_power <- as.numeric(data$Global_active_power)

##plot
png(file = "plot1.png", bg = "transparent", width = 480, height = 480)
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power(kilowalt)", cex.axis = 0.8, cex.lab = 0.9)

dev.off()
