# Load the data
data <- read.table("household_power_consumption.txt", 
                   header = TRUE, 
                   sep = ";", 
                   na.strings = "?", 
                   skip = 66636,  # Skip rows until 2007-02-01
                   nrows = 2880)  # Read 2880 rows (2 days of data)

# Add column names
colnames(data) <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                    "Voltage", "Global_intensity", "Sub_metering_1", 
                    "Sub_metering_2", "Sub_metering_3")

# Convert Date and Time to a single DateTime column
data$DateTime <- strptime(paste(data$Date, data$Time), format = "%d/%m/%Y %H:%M:%S")

# Create 2x2 grid Plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2,2))

#Plot1
plot(data$DateTime, data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

#plot2
plot(data$DateTime, data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "voltage")

#Plot3
plot(data$DateTime, data$Sub_metering_1, 
     type = "l", 
     xlab = "", 
     ylab = "Energy sub metering")
lines(data$DateTime, data$Sub_metering_2, col = "red")
lines(data$DateTime, data$Sub_metering_3, col = "blue")
legend("topright", 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), 
       lty = 1,
       bty = "n")

#Plot4
plot(data$DateTime, data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global Reactive Power")
dev.off()
