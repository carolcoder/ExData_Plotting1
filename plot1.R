
# Finding dataset col classes...
# dataset <- read.table("household_power_consumption.txt", nrows=1, sep=";", header = TRUE)

# str(dataset)

# cols <- c()
# i <- 1
# lapply(dataset, function(x) {
#   cols[i] <<- class(x)
#  i <<- i + 1
# })

# dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE, colClasses = cols)

dataset <- read.table("household_power_consumption.txt", sep=";", header = TRUE)
dateTime <- paste(dataset$Date, dataset$Time)
dataset$Date <- as.Date(dataset$Date, "%d/%m/%Y")
dataset$DateTime <- strptime(dateTime, format="%d/%m/%Y %H:%M:%S")
str(dataset)
datePeriod <-as.Date(c('01/02/2007','02/02/2007'), "%d/%m/%Y")
datePeriod
dataset <- dataset[dataset$Date %in% datePeriod ,]
dataset$Global_active_power <- as.numeric(as.character(dataset$Global_active_power))
hist(dataset$Global_active_power, xlab="Global Active Power (kilowatts)", col="red", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()
