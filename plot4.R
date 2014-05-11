library(sqldf)

#Reading Data
fn <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.csv.sql(fn, sql = 'select Voltage, Global_reactive_power, Sub_metering_1, Sub_metering_2, Sub_metering_3, Global_active_power from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")

#Plotting data
png("plot4.png")
par(mfrow=c(2,2))
plot(as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)",xlab="",axes=F)
box()
axis(2)
len <- length(data$Global_active_power)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))

plot(as.numeric(data$Voltage), type="l", ylab="Voltage",xlab="datetime",axes=F)
box()
axis(2)
len <- length(data$Voltage)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))

plot(as.numeric(data$Sub_metering_1), type="l", ylab="Energy sub metering",xlab="",axes=F)
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
box()
axis(2)
len <- length(data$Sub_metering_1)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c(colnames(data)[c(3,4,5)]),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))

plot(as.numeric(data$Global_reactive_power), type="l", ylab="Global_reactive_power",xlab="datetime",axes=F)
box()
axis(2)
len <- length(data$Global_reactive_power)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))

dev.off()
