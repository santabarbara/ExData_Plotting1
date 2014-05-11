library(sqldf)

#Reading data
fn <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.csv.sql(fn, sql = 'select Sub_metering_1, Sub_metering_2, Sub_metering_3 from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")

#Plotting data
png("plot3.png")
plot(as.numeric(data$Sub_metering_1), type="l", ylab="Energy sub metering",xlab="",axes=F)
lines(as.numeric(data$Sub_metering_2), col="red")
lines(as.numeric(data$Sub_metering_3), col="blue")
box()
axis(2)
len <- length(data$Sub_metering_1)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))
legend("topright",legend=c(colnames(data)),lwd=c(2.5,2.5,2.5), col=c("black","red","blue"))
dev.off()


