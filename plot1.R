# Load and store data into variable 'DATA'
source("loader.R")

png(file = "plot1.png", width = 480, height = 480, units = "px") ## Open PNG device

par(mfcol=c(1,1))  # single chart

# Plots simple histogram with labels
with(DATA, hist(Global_active_power, main = "Global Active Power", xlab="Global Active Power (kilowatts)", col="orange"))

dev.off() # close device