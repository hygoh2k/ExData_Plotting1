
setwd("/Users/faith2k/coursera/exdata/assgin1/")
data <- read.csv(file="household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#data <- read.csv(file="household_power_consumption_min.txt", sep = ";", header = TRUE, na.strings = "?")
#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#data <- data[data$Date %in% c(as.Date("2006-12-16"), as.Date("2006-12-17")),]
#getting the data range from date 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
#create a colume named "DateTime" that combines Date and Time
data$DateTime <- paste (data$Date, data$Time, sep = " ", collapse = NULL)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

#generating plot and save as png image
png("plot2.png", width = 480, height = 480)
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power (kilowatts)", type="line", xlab="")
dev.off()


