#load the raw data
#script assumes that you have downloaded and unpacked the "household_power_consumption.txt" 
#into your working directory

data <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";", na.strings = "?")

#extract Electrical Power Consumption data for the 2 days into new dataframe
#seems we don't need to convert to date first!
epc <- subset(data, Date == "1/2/2007" |  Date == "2/2/2007")

#create a new column with the dateTime conversions
epc$dateTime <- strptime(paste(epc$Date, epc$Time),"%d/%m/%Y %H:%M:%S" )

#create png 
png("plot4.png", width = 480, height = 480)

#create 2 rows and 2 columns for the graphs

par(mfrow = c(2,2))

#one
plot(epc$dateTime, epc$Global_active_power, type ="l", xlab ="", ylab = "Global Active Power(kilowatts)")

#two
plot(epc$dateTime, epc$Voltage,type = "l", xlab = "datetime", ylab = "Voltage")

#three
plot(x = epc$dateTime, y = epc$Sub_metering_1, ylab = "Energy sub metering", xlab = "", type = "l")

lines(epc$dateTime, epc$Sub_metering_2, col="red")
lines(epc$dateTime, epc$Sub_metering_3, col="blue")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty = 1)

#four

plot(epc$dateTime, epc$Global_reactive_power,type = "l", xlab = "datetime", ylab = "Global_reactive_power")



dev.off()