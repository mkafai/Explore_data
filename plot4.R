data <- read.table('data.txt',sep=';',header=TRUE,stringsAsFactors=FALSE)
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date <- as.Date(data$Date,"%d/%m/%Y")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Global_reactive_power <- as.numeric(data$Global_reactive_power)
data$Voltage <- as.numeric(data$Voltage)

data$Date <- paste(as.character(data$Date), data$Time)
datetime <- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))
plot(datetime,data$Global_active_power,type = "l",
     xlab=" ",
     ylab = "Global Active Power")
plot(datetime,data$Voltage,type = "l",
     ylab = "Voltage")
plot(datetime,data$Sub_metering_1,type = "l",
     xlab=" ",
     ylab = "Energy sub metering")
points(datetime,data$Sub_metering_2,col="red",type = "l")
points(datetime,data$Sub_metering_3,col="blue",type = "l")
legend("topright", col = c("black","blue", "red"), lty=c(1,1,1),legend = names(data[c(7,8,9)]))
plot(datetime,data$Global_reactive_power,type = "l",ylab="Global_reactive_power")
dev.off()