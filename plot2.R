# plot2.R

# Read data and variable cleanup
data <- read.csv2("./household_power_consumption.txt")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- suppressWarnings(as.numeric(as.character(data$Global_active_power)))

# Subset dates
cdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Delete data set
rm(data)

# Plot 2 - Day of week vs. Global Active Power
plot(cdata$Time, cdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# Create png file of Plot 2
png(filename="plot2.png", width=480, height=480)
plot(cdata$Time, cdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
