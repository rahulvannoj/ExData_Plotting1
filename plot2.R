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

#Create Line Plot
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, 
     type = "l", 
     xlab = "",
     ylab = "Global Active Power (Kilowatts)" )
dev.off()