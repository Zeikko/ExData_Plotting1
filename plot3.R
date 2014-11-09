library(dplyr)

#Read data
csv <- read.csv("household_power_consumption.txt", sep=";")
#Converts dates to date objects
csv$Date <- as.Date(csv$Date, format="%d/%m/%Y")
#Filter data by date
data <- filter(csv, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))
#Open plotting window on a linux machine (for some reason this is required on my machine)
x11()
#Create plot
plot(as.numeric(as.character(data$Sub_metering_1)), ylim=c(0, 38),  xaxt='n', xlab="", ylab="Energy sub metering", type="l")
par(new=TRUE)
plot(as.numeric(as.character(data$Sub_metering_2)), ylim=c(0, 38), col="red",  xaxt='n', ylab="", xlab="", type="l")
par(new=TRUE)
plot(as.numeric(as.character(data$Sub_metering_3)), ylim=c(0, 38), col="blue",  xaxt='n', ylab="", xlab="", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))
legend("topright", pch="_", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#Save plot to png
dev.copy(png, file="plot3.png")
dev.off()