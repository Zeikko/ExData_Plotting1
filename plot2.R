library(dplyr)

#Read data
csv <- read.csv("household_power_consumption.txt", sep=";")
#Converts dates to date objects
csv$Date <- as.Date(csv$Date, format="%d/%m/%Y")
#Filter data by date
data <- filter(csv, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))
#Open PNG Graphics device
png("plot2.png")
#Create plot
plot(as.numeric(as.character(data$Global_active_power)),  xaxt='n', xlab="", ylab="Global Active Power (kilowatts)", type="l")
axis(1, at=c(1, nrow(data)/2, nrow(data)), labels=c("Thu", "Fri", "Sat"))
#Save plot to png
dev.off()