# Load and store data into variable 'DATA'
source("loader.R")

png(file = "plot2.png", width = 480, height = 480, units = "px") ## Open PNG device

par(mfcol=c(1,1))  # single chart

# Plot data using line. Subtitle only on 'y' axis
with(DATA, plot(datetime, Global_active_power, type="l", main="", xlab="", ylab="Global Active Power (kilowatts)"))

dev.off() # close device