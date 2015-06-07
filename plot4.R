## Course Project 1 Code:

##Read in the DATA:
##First use setwd() to set your working directory to the folder with the data unzipped.
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F)

##Convert date to R standard:

## data$Time<- strptime(data$Time, format = "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")

data1<-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")

##Code below here did not work, just kept it for reference
##days<-paste(as.character(data1$Date), data1$Time)
##days<- as.Date(days, "%Y-%m-%d %H:%M:%S")
##data1$Time<- days

dateTime   <- as.POSIXlt(paste(as.Date(data1$Date, format="%d/%m/%Y"), data1$Time, sep=" "))
png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

plot(dateTime, data1$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")
plot(dateTime, data1$Voltage, type = "l", xlab ="datetime", ylab = "Voltage")

plot(dateTime, data1$Sub_metering_1, type = "l", xlab ="", ylab = "Energy sub metering")
points(dateTime, data1$Sub_metering_2, type = "l", col = "red")
points(dateTime, data1$Sub_metering_3, type = "l", col = "blue")
legend('topright', c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black","red","blue"), cex = 0.8, bty = "n")

plot(dateTime, data1$Global_reactive_power, type = "l", xlab ="datetime", ylab = "Global_reactive_power")


dev.off()