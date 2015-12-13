# plot4.R

# Read data and variable cleanup
data <- read.csv2("./household_power_consumption.txt")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- suppressWarnings(as.numeric(as.character(data$Global_active_power)))
data$Voltage <- suppressWarnings(as.numeric(as.character(data$Voltage)))
data$Sub_metering_1 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_1)))
data$Sub_metering_2 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_2)))
data$Sub_metering_3 <- suppressWarnings(as.numeric(as.character(data$Sub_metering_3)))
data$Global_reactive_power <- suppressWarnings(as.numeric(as.character(data$Global_reactive_power)))

# Subset dates
cdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Delete data set
rm(data)

# Plot 4 - 4 plots
par(mfrow=c(2,2))
# plot 1
plot(cdata$Time, cdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# plot 2
plot(cdata$Time, cdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 3
plot(cdata$Time, cdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(cdata$Time, cdata$Sub_metering_2, col="red")
lines(cdata$Time, cdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black","red","blue"))
# plot 4
plot(cdata$Time, cdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

# Create png file of Plot 4
png(filename="plot4.png", width=480, height=480)
par(mfrow=c(2,2))
# plot 1
plot(cdata$Time, cdata$Global_active_power, type="l", xlab="", ylab="Global Active Power")
# plot 2
plot(cdata$Time, cdata$Voltage, type="l", xlab="datetime", ylab="Voltage")
# plot 3
plot(cdata$Time, cdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(cdata$Time, cdata$Sub_metering_2, col="red")
lines(cdata$Time, cdata$Sub_metering_3, col="blue")
legend("topright", legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), bty="n", lty=c(1,1,1), col=c("black","red","blue"))
# plot 4
plot(cdata$Time, cdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.off()
