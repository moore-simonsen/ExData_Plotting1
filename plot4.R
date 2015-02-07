##Load "sqldf" package into R
library(sqldf)

##Reding in the data
data <- read.csv.sql("/datasciencecoursera/household_power_consumption 2.txt", 
                     header = TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##Converting Data and Time variables to Date/Time classes in R together in new col
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##Launch png graphic device and name the file
png("plot4.png")

##Initiating the making of 4 plots boxed as 2 rows and 2 cols
par(mfrow = c(2,2))

##Making the first plot in the upper left corner (plot similar to plot2)
plot(data$datetime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Making the second plot in the upper right corner, voltage compared to datetime
plot(data$datetime, data$Voltage, type = "l", xlab="datetime", ylab="Voltage")

##Making the third plot (similar to plot3 but without a lined box around the legend)
##in the lower left corner
plot(data$datetime, data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red", xlab="", ylab="Energy sub metering" )
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue", xlab="", ylab="Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = .75, bty = "n", cex = .75)

##Making the fourth plot in the lower right corner
plot(data$datetime, data$Global_reactive_power, type = "l", xlab = "datetime", ylab = "Global_reactive_power")

##Shotting off the graphic device
dev.off()
