#load the raw data
#script assumes that you have downloaded and unpacked the "household_power_consumption.txt" 
#into your working directory

rawData <- read.csv("household_power_consumption.txt", header = TRUE, stringsAsFactors = FALSE, sep = ";")
#drop the time column as it is not needed
pcData <- select(rawData, -(Time))

#set date locale so that dates behave predictably
lct <- Sys.getlocale("LC_TIME"); Sys.setlocale("LC_TIME", "C")
#set date column format to date class
pcData$Date <- as.Date(rawData$Date, format = "%d/%m/%Y")

#extract Electrical Power Consumption data for the 2 days into new dataframe
epc <- rbind(subset(pcData, Date == as.Date("2007-02-01")), subset(pcData, Date == as.Date("2007-02-02")))

#create png
png("plot1.png", width = 480, height = 480)

hist(as.numeric(epc$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency", main = "Global Active Power")

dev.Off()

##reset sys time 
Sys.setlocale("LC_TIME", lct)