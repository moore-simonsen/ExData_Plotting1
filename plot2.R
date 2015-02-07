##Open package "sqldf"
library(sqldf)

##Reding in the data
data <- read.csv.sql("/household_power_consumption 2.txt", 
                     header = TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##Converting Data and Time variables to Date/Time classes in R together in new col
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##Making png file and adding plot2
png("plot2.png")
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Closing graphic device
dev.off()