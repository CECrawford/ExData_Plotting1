#load the raw data
#script assumes that you have downloaded and unpacked the "household_power_consumption.txt" 
#into your working directory

data <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

#extract Electrical Power Consumption data for the 2 days into new dataframe
#seems we don't need to convert to date first!
epc <- subset(data, Date == "1/2/2007" |  Date == "2/2/2007")

#create a new column with the dateTime conversions
epc$dateTime <- strptime(paste(epc$Date, epc$Time),"%d/%m/%Y %H:%M:%S" )


png("plot3.png", width = 480, height = 480)

plot(x = epc$dateTime, y = epc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")

lines(epc$dateTime, epc$Sub_metering_2, col="red")
lines(epc$dateTime, epc$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)


dev.off()