data <- read.table('data.txt',sep=';',header=TRUE,stringsAsFactors=FALSE)
data <- data[data$Date=='1/2/2007' | data$Date=='2/2/2007',]
data$Date <- as.Date(data$Date,"%d/%m/%Y")
data$Global_active_power <- as.numeric(data$Global_active_power)
png(filename = "plot1.png", width = 480, height = 480)
hist(data$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()