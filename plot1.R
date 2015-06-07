## Course Project 1 Code:

##Read in the DATA:
##First use setwd() to set your working directory to the folder with the data unzipped.
data<- read.table("household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=F)

##Convert date to R standard:

data$Time<- strptime(data$Time, format = "%H:%M:%S")
data$Date<-as.Date(data$Date, "%d/%m/%Y")

##This code was not needed, kept for reference:
 ##       days<-weekdays(datadate)
## data<-cbind(days, data)

data1<-subset(data, data$Date >= "2007-02-01" & data$Date <= "2007-02-02")
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(as.numeric(data1$Global_active_power), main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()