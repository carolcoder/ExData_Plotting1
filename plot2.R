dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
dateTime <- paste(dataset$Date, dataset$Time)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$DateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
str(dataset)
datePeriod <-as.Date(c('01/02/2007','02/02/2007'), "%d/%m/%Y")
datePeriod
dataset <- dataset[dataset$Date %in% datePeriod ,]
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
with(dataset, plot(DateTime, Global_active_power, pch=19, type="n", xlab="", ylab="Global Active Power (kilowatts)"))
with(dataset, lines(DateTime, Global_active_power))
dev.copy(png, file="plot2.png")
dev.off()
