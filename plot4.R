dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
dateTime <- paste(dataset$Date, dataset$Time)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$DateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
str(dataset)
datePeriod <-as.Date(c('01/02/2007','02/02/2007'), "%d/%m/%Y")
datePeriod
dataset <- dataset[dataset$Date %in% datePeriod ,]
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
dataset$Global_reactive_power <- as.numeric(as.character(dataset$Global_reactive_power))
dataset$Voltage <- as.numeric(as.character(dataset$Voltage))

par(mfrow=c(2,2))
with(dataset, {
  plot(DateTime, Global_active_power, type="n", xlab="", ylab="Global Active Power")
  lines(DateTime, Global_active_power)
  plot(DateTime, Voltage, type="n", xlab="datetime")
  lines(DateTime, Voltage)
  plot(DateTime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering", ylim=c(0, 30), cex=0.75)
  lines(DateTime, Sub_metering_1, col="grey")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend(bty = "n", cex = 0.65, "topright", lwd="2", col=c("grey","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="n", xlab="datetime", ylim=c(0.0,0.5), cex=0.75)
  lines(DateTime, Global_reactive_power)
})
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()

