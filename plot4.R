library(dplyr)

#Read data
csv <- read.csv("household_power_consumption.txt", sep=";")
#Converts dates to date objects
csv$Date <- as.Date(csv$Date, format="%d/%m/%Y")
#Filter data by date
data <- filter(csv, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))
#Open PNG Graphics device
png("plot4.png")
par(mfcol=c(2,2))
#Plot 1
plot(as.numeric(as.character(data$Global_active_power)),  xaxt='n', xlab="", ylab="Global Active Power", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))

#Plot 2
plot(as.numeric(as.character(data$Sub_metering_1)), ylim=c(0, 38),  xaxt='n', xlab="", ylab="Energy sub metering", type="l")
par(new=TRUE)
plot(as.numeric(as.character(data$Sub_metering_2)), ylim=c(0, 38), col="red",  xaxt='n', ylab="", xlab="", type="l")
par(new=TRUE)
plot(as.numeric(as.character(data$Sub_metering_3)), ylim=c(0, 38), col="blue",  xaxt='n', ylab="", xlab="", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))
legend("topright", bty="n", lty="solid", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Plot 3
plot(as.numeric(as.character(data$Voltage)),  xaxt='n', xlab="datetime", ylab="Voltage", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))

#Plot 4
plot(as.numeric(as.character(data$Global_reactive_power)),  xaxt='n', xlab="datetime", ylab="Global_reactive_power", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))

#Save plot to png
dev.off()
