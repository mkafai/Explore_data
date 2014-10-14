data <- read.table('data.txt',sep=';',header=TRUE,stringsAsFactors=FALSE)
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
data$Date <- paste(as.character(data$Date), data$Time)
datetime<- strptime(data$Date,"%Y-%m-%d %H:%M:%S")
png(filename = "plot2.png", width = 480, height = 480)
plot(datetime,data$Global_active_power,type = "l",
     xlab=" ",
     ylab = "Global Active Power (kilowatts)")
dev.off()


