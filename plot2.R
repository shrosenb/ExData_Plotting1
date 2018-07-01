
#Read the date 
dataFileName <- "./household_power_consumption.txt"
data <- read.table(dataFileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#subset to the dates we are interested in
data$Date <- as.Date(data$Date, format = "%d-%m-%Y")
data <- subset(data, Date >= "2007-02-01" & Date <= "2007-02-02")

data$datetime <- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")
data$datetime <- as.POSIXct(data$datetime)

#plot the diagram
with(data,
     plot(Global_active_power ~ datetime, 
          type = "l",
          ylab = "Global Active Power (kilowatts)", 
          xlab = ""
     )
)

#copy to output file
dev.copy(png, file = "./ExData_Plotting1/plot2.png", height = 480, width = 480)
dev.off()     

