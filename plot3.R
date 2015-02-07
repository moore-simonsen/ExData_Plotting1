##Loading the "sqldf" package
library(sqldf)

##Reding in the data
data <- read.csv.sql("/datasciencecoursera/household_power_consumption 2.txt", 
                     header = TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##Converting Data and Time variables to Date/Time classes in R together in new col
data$datetime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

##Open a png file and naming it
png("plot3.png")

##Making the plot with the use of plot(), lines() and legend()
plot(data$datetime, data$Sub_metering_1, type = "l", xlab="", ylab="Energy sub metering")
lines(data$datetime, data$Sub_metering_2, type = "l", col = "red", xlab="", ylab="Energy sub metering" )
lines(data$datetime, data$Sub_metering_3, type = "l", col = "blue", xlab="", ylab="Energy sub metering")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lwd = .75, cex = .75)

##Closing the graphic device 
dev.off()
