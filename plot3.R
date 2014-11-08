# Load and store data into variable 'data'
source("loader.R")

png(file = "plot3.png", width = 480, height = 480, units = "px") ## Open PNG device

par(mfcol=c(1,1))  # single chart

# Plot multiple charts, for each metering
with(DATA, plot(datetime, Sub_metering_1, type="l", main="", xlab="", ylab="Energy sub metering", ylim=c(0,30)))
with(DATA, lines(datetime, Sub_metering_2, type="l", col="red"))
with(DATA, lines(datetime, Sub_metering_3, type="l", col="blue"))
# And legends, one for each chart
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"))

dev.off() # close device