setwd("/Users/faith2k/coursera/exdata/assgin1/")
data <- read.csv(file="household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#data$Date <- as.Date(data$Date , "%d/%m/%Y")
#data$Time <- strptime(data$Time, "%H:%M:%S")

#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")
#getting the data range from date 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]


#generating histogram and save as png image
png("plot1.png", width = 480, height = 480)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red", na.rm = TRUE)
dev.off()
