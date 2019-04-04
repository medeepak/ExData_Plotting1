library(dplyr)

#Read the power consumption dataset 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#Subset only data from 1st and 2nd Feb, 2007
data_of_interest <- subset(data, (Date == "1/2/2007")|(Date == "2/2/2007") )
#Remove larger dataset to free up memory
rm(data)

#Add a new column that combines both date and time
data_of_interest$date_time <- strptime(paste(data_of_interest$Date,data_of_interest$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png", width = 480, height = 480)
#Scatter Plot
with(data_of_interest, plot(date_time, Global_active_power,type = "l", ylab = "Global Active Power (kilowatts)", xlab= ""))
dev.off()