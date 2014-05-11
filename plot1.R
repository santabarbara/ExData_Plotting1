library(sqldf)
#Reading data
fn <- "exdata-data-household_power_consumption/household_power_consumption.txt"
data <- read.csv.sql(fn, sql = 'select Global_active_power from file where Date = "1/2/2007" OR Date = "2/2/2007"', header=T, sep=";")

#Plotting Global actibe power
png("plot1.png")
hist(as.numeric(data$Global_active_power), col="red", xlab="Global Active Power (kilowatts)", main = "Global Active Power")
dev.off()

