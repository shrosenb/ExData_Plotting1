
#Read the date 
dataFileName <- "./household_power_consumption.txt"
data <- read.table(dataFileName, header = TRUE, sep = ";", stringsAsFactors = FALSE, na.strings = "?")

#subset to the dates we are interested in
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")
data <- subset(data, Date >= "2007/02/01" & Date <= "2007/02/02")

#plot the diagram
hist(data$Global_active_power, 
     main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", 
     col = "Red")

#copy to output file
dev.copy(png, file = "./ExData_Plotting1/plot1.png", height = 480, width = 480)
dev.off()     


