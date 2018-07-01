
#Read the date 
dataFileName <- "./household_power_consumption.txt"
data <- read.table(dataFileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#subset to the dates we are interested in
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date >= "2007/02/01" & Date <= "2007/02/02")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#plot the diagram
par(mfrow = c(2, 2))

with(data, 
     plot(Global_active_power ~ datetime, 
          type = "l", 
          ylab = "Global Active Power", 
          xlab = "")
)
with(data, 
     plot(Voltage ~ datetime, 
          type = "l")
)
with(data, 
     plot(Sub_metering_1 ~ datetime, 
          type = "l", 
          ylab = "Energy sub metering", 
          xlab = "")
)
lines(data$Sub_metering_2 ~ data$datetime, col = "Red")
lines(data$Sub_metering_3 ~ data$datetime, col = "Blue")
legend("topright", 
       lty = 1, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       bty = "n")

with(data, 
     plot(Global_reactive_power ~ datetime, 
          type = "l")
)


#copy to output file
dev.copy(png, file = "./ExData_Plotting1/plot4.png", height = 480, width = 480)
dev.off()     
