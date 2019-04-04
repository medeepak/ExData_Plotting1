library(dplyr)

#Read the power consumption dataset 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#Subset only data from 1st and 2nd Feb, 2007
data_of_interest <- subset(data, (Date == "1/2/2007")|(Date == "2/2/2007") )
#Remove larger dataset to free up memory
rm(data)

#Add a new column that combines both date and time
data_of_interest$date_time <- strptime(paste(data_of_interest$Date,data_of_interest$Time),"%d/%m/%Y %H:%M:%S")

#Plot in png file
png(file="plot4.png", width = 480, height = 480)

#Set format of plots along with margins
par(mfrow=c(2,2), mar=c(4,4,4,1), cex=0.5)

with(data_of_interest, plot(date_time, Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab= ""))
with(data_of_interest, plot(date_time, Voltage,type = "l", ylab = "Voltage", xlab= "datetime"))

with(data_of_interest, plot(date_time, Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab= ""))
points(data_of_interest$date_time, data_of_interest$Sub_metering_2, type = "l", col = "red")
points(data_of_interest$date_time, data_of_interest$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = names(data_of_interest)[7:9], col = c("black", "red", "blue"),ncol = 1, lwd=1, cex = 1)

with(data_of_interest, plot(date_time, Global_reactive_power,type = "l", ylab = "Global_reactive_power", xlab= "datetime"))
dev.off()
