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
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(dateTime, data1$Global_active_power, type = "l", xlab ="", ylab = "Global Active Power (kilowatts)")


dev.off()