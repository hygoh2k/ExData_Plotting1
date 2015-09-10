
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

#generating plots and save as png image
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) #create 2x2 layout 
plot(data$DateTime, data$Global_active_power, ylab = "Global Active Power", type="line", xlab="") #first plot
plot(data$DateTime, data$Voltage, ylab = "Voltage", type="line", xlab="datetime") #second plot

yrange<-range(c(data$Sub_metering_1, data$Sub_metering_2, data$Sub_metering_3))
plot(data$DateTime, data$Sub_metering_1, ylab = "Energy Sub Metering", type="line", xlab="", col="black", ylim=yrange) #third plot
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_2, ylab = "Energy Sub Metering", type="line", xlab="", col="red", ylim=yrange) #third plot
par(new=TRUE)
plot(data$DateTime, data$Sub_metering_3, ylab = "Energy Sub Metering", type="line", xlab="", col="blue", ylim=yrange) #third plot
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1,1), col = c("black", "red", "blue") , bty="n")

plot(data$DateTime, data$Global_reactive_power, ylab = "Global_reactive_power", type="line", xlab="datetime") #fourth plot
dev.off()
