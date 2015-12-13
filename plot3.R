# plot3.R

# Read data and variable cleanup
data <- read.csv2("./household_power_consumption.txt")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Sub_metering_1 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_3)))

# Subset dates
cdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Delete data set
rm(data)

# Plot 3 - Day of week vs. Sub metering
plot(cdata$Time, cdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(cdata$Time, cdata$Sub_metering_2, col="red")
lines(cdata$Time, cdata$Sub_metering_3, col="blue")
# Add legend
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))


# Create png file of Plot 3
png(filename="plot3.png", width=480, height=480)
plot(cdata$Time, cdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(cdata$Time, cdata$Sub_metering_2, col="red")
lines(cdata$Time, cdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), col=c("black","red","blue"))
dev.off()
