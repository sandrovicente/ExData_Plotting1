# Load and store data into variable 'DATA'
source("loader.R")

png(file = "plot4.png", width = 480, height = 480, units = "px") ## Open PNG device

# shows multiple charts: 2x2, 1st column first, then 2nd column
par(mfcol=c(2,2), mar = c(4,4,4,1))  

# 1ST COLUMN

# CHART 1 - Global Active Power
# Plot data using line. Subtitle only on 'y' axis
with(DATA, plot(datetime, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))

# CHART 2 - Energy Sub metering
# Plot multiple charts, for each metering
with(DATA, plot(datetime, Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", ylim=c(0,30)), mar=c(1,1,1,1) )
with(DATA, lines(datetime, Sub_metering_2, type="l", col="red"))
with(DATA, lines(datetime, Sub_metering_3, type="l", col="blue"))

# And legends, one for each chart
# lty: symbols (lines)
# lwd: thickness 
# col: line colours
# cex: proportional size
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), cex=0.7)

# 2ND COLUMN

# CHART 3 - Voltage
with(DATA, plot(datetime, Voltage, type="l", main=""))

# CHART 4 - Global reactive power
with(DATA, plot(datetime, Global_reactive_power, type="l", main=""))

dev.off() # close device