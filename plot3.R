# Code for Plot 3
library(dplyr)
library(lubridate)
#setwd("D:/Data Science/Course/04_Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
# Enusre the data is downloaded in your working directory and unzipped
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Master.zip")
#unzip("Master.zip")
dataset <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
dataset <- mutate(dataset,datetime = paste(Date,Time,sep = " "))#combining datetime
dataset <- mutate(dataset, Date = dmy(dataset$Date,tz = "Asia/Calcutta"),datetime = dmy_hms(datetime,tz = "Asia/Calcutta"))#converting to correct datetime formats
maindata <- subset(dataset,(Date == "2007-02-01" | Date == "2007-02-02")) # Subsetting to required date ranges
maindata <- mutate(maindata,Sub_metering_1 = as.numeric(Sub_metering_1),Sub_metering_2 = as.numeric(Sub_metering_2),Sub_metering_3 = as.numeric(Sub_metering_3))#converting ratings to numeric
#Making the actual plot
png(file = "plot3.png")
with(maindata,plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
lines(maindata$datetime,maindata$Sub_metering_2,col="red")
lines(maindata$datetime,maindata$Sub_metering_3,col="blue")
legend("topright",pch = "_",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()
print("Plot updated in a file called 'plot3.png' in the working directory...")
rm(maindata)
rm(dataset)


