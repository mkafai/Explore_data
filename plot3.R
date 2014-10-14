data <- read.table('data.txt',sep=';',header=TRUE,stringsAsFactors=FALSE)
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date <- as.Date(data$Date,"%d/%m/%Y")

data$Sub_metering_1 <- as.numeric(data$Sub_metering_1)
data$Sub_metering_2 <- as.numeric(data$Sub_metering_2)
data$Sub_metering_3 <- as.numeric(data$Sub_metering_3)

data$Date <- paste(as.character(data$Date), data$Time)
datetime<- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
png(filename = "plot3.png", width = 480, height = 480)
plot(datetime,data$Sub_metering_1,type = "l",
     xlab=" ",
     ylab = "Energy sub metering")
points(datetime,data$Sub_metering_2,col="red",type = "l")
points(datetime,data$Sub_metering_3,col="blue",type = "l")
legend("topright", col = c("black","blue", "red"), lty=c(1,1,1),legend = names(data[c(7,8,9)]))

dev.off()
