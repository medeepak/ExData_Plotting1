library(dplyr)

#Read the power consumption dataset 
data <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, stringsAsFactors = FALSE)
#Subset only data from 1st and 2nd Feb, 2007
data_of_interest <- subset(data, (Date == "1/2/2007")|(Date == "2/2/2007") )
#Remove larger dataset to free up memory
rm(data)

#Plot in png file
png(file="plot1.png", width = 480, height = 480)
hist(as.numeric(data_of_interest$Global_active_power), col = "red", xlab = "Global Active Power (kilowatts)", main="Global Active Power")
dev.off()