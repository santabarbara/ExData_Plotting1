library(sqldf)
#Reading data
fn <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.csv.sql(fn, sql = 'select Global_active_power from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")

#Plotting Global actibe power
png("plot2.png")
plot(as.numeric(data$Global_active_power), type="l", ylab="Global Active Power (kilowatts)",xlab="",axes=F)
box()
axis(2)
len <- length(data$Global_active_power)
axis(1,at=c(0,len/2,len),labels=c("Thu","Fri","Sat"))
dev.off()



