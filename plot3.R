# setwd("D:/DS/coursera.og - exploratory data analysis")

# Coursera Exploratory Data Analysis 10/10/14
# Course Project 1 - Plot 1

# Read the data file

data <- read.table("household_power_consumption.txt", header=TRUE, sep=';',
                   na.strings="?",nrows=80000, stringsAsFactors=FALSE)
str(data)

# NAs represented by ?

# Convert date and time strings to R Date/Time classes
data <- within(data, DateTime <- as.POSIXlt(paste(Date, Time),
                                            format = "%d/%m/%Y %H:%M:%S"))

# subset for dates b/w 2007-02-01 and 2007-02-02
data <- subset(data, DateTime >= as.POSIXlt("2007-02-01") &
                 DateTime < as.POSIXlt("2007-02-03"))

png("plot3.png")
plot(data$DateTime, data$Sub_metering_1, type="l", xlab="",
     ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1)
dev.off()