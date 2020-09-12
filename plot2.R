# Code for Plot 2
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
maindata <- mutate(maindata,Global_active_power = as.numeric(Global_active_power))#converting Global_active_power ratings to numeric
#Making the actual plot
png(file = "plot2.png")
with(maindata,plot(datetime,Global_active_power,type = "l",ylab = "Global Active Power (Kilowatts)",xlab = ""))
dev.off()
print("Plot updated in a file called 'plot2.png' in the working directory...")
rm(maindata)
rm(dataset)