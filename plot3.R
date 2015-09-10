
setwd("/Users/faith2k/coursera/exdata/assgin1/")
data <- read.csv(file="household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
#data <- read.csv(file="household_power_consumption_min.txt", sep = ";", header = TRUE, na.strings = "?")
#format date
data$Date <- as.Date(data$Date, "%d/%m/%Y")

#getting the data range from date 2007-02-01 to 2007-02-02
data <- data[data$Date %in% c(as.Date("2007-02-01"), as.Date("2007-02-02")),]
#create a colume named "DateTime" that combines Date and Time
data$DateTime <- paste (data$Date, data$Time, sep = " ", collapse = NULL)
data$DateTime <- strptime(data$DateTime, "%Y-%m-%d %H:%M:%S")

#generating plot and save as png image
png("plot3.png", width = 480, height = 480)
yrange<-range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", type="line", xlab="", col="black", ylim=yrange)
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_2, ylab = "Energy Sub Metering", type="line", xlab="", col="red", ylim=yrange)
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_3, ylab = "Energy Sub Metering", type="line", xlab="", col="blue", ylim=yrange)
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue") )
dev.off()


