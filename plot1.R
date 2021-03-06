# Code for Plot 1
library(dplyr)
#setwd("D:/Data Science/Course/04_Exploratory Data Analysis/Week 1/Project/ExData_Plotting1")
# Enusre the data is downloaded in your working directory and unzipped
#download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",destfile = "Master.zip")
#unzip("Master.zip")
dataset <- read.table("household_power_consumption.txt",sep = ";",header = TRUE)
dataset <- mutate(dataset, Date = as.Date(dataset$Date,"%d/%m/%Y")) # Converting Dates
maindata <- subset(dataset,(Date == "2007-02-01" | Date == "2007-02-02")) # Subsetting to required date ranges
rm(dataset) # cleaning memory
maindata <- mutate(maindata,Global_active_power = as.numeric(Global_active_power))#converting Global_active_power ratings to numeric
#Making the actual plot
png(file = "plot1.png")
hist(maindata$Global_active_power,col = "red",main = "Global Active Power",xlab = "Global Active Power (Kilowatts)")
dev.off()
print("Plot updated in a file called 'plot1.png' in the working directory...")
rm(maindata)