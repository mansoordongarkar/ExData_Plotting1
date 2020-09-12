# Code for Plot 4
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
maindata <- mutate(maindata,Global_active_power = as.numeric(Global_active_power),Global_reactive_power=as.numeric(Global_reactive_power),Voltage=as.numeric(Voltage),Sub_metering_1 = as.numeric(Sub_metering_1),Sub_metering_2 = as.numeric(Sub_metering_2),Sub_metering_3 = as.numeric(Sub_metering_3))#converting ratings to numeric

#Making the actual plot
png(file = "plot4.png")
par(mfrow = c(2,2)) #framework for plots
#Plot top lh
with(maindata,plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power",xlab = ""))
#plot top rh
with(maindata,plot(datetime,Voltage,type = "l"))

#plot bottom lh
with(maindata,plot(datetime,Sub_metering_1,type = "l",ylab = "Energy sub metering",xlab = ""))
lines(maindata$datetime,maindata$Sub_metering_2,col="red")
lines(maindata$datetime,maindata$Sub_metering_3,col="blue")
legend("topright",pch = "_",col = c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#plot bottom rh
with(maindata,plot(datetime,Global_reactive_power,type = "l"))
dev.off()
print("Plot updated in a file called 'plot4.png' in the working directory...")
rm(maindata)
rm(dataset)

