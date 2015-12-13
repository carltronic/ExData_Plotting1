# plot1.R

# Read data and variable cleanup
data <- read.csv2("./household_power_consumption.txt")
data$Time <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power <- suppressWarnings(as.numeric(as.character(data$Global_active_power)))

# Subset dates
cdata <- data[data$Date>="2007-02-01" & data$Date<="2007-02-02",]

# Delete data set
rm(data)

# Plot 1 - Histogram of Global Active Power
hist(cdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")

# Create png file of Plot 1
png(filename="plot1.png", width=480, height=480)
hist(cdata$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red")
dev.off()
