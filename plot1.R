library(dplyr)

#Read data
csv <- read.csv("household_power_consumption.txt", sep=";")
#Converts dates to date objects
csv$Date <- as.Date(csv$Date, format="%d/%m/%Y")
#Filter data by date
data <- filter(csv, Date >= as.Date('2007-02-01'))
data <- filter(data, Date <= as.Date('2007-02-02'))
#Open PNG Graphics device
png("plot1.png")
#Create histogram
hist(as.numeric(as.character(data$Global_active_power)), main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)")
#Save histogram to png
dev.off()