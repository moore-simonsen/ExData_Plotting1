##Open package "sqldf"
library(sgldf)

##Reding in the data
data2 <- read.csv.sql("/household_power_consumption 2.txt", 
                     header = TRUE, sep=";",
                     sql="Select * from file where Date = '1/2/2007' OR Date = '2/2/2007'")

##Launching a png graphics device and naming the plot
png("plot1.png")

##Making a histogram out of the data from the Globale_active_power column
hist(data2$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

##Closing the graphics device
dev.off()
