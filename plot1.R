#set workign directory
setwd("D:/Research/Data Science/Exploratory Data Analysis/exdata_data_household_power_consumption")
#read data into R

data_orig = read.table("household_power_consumption.txt", sep=";", header = TRUE)

data <- data_orig

#convert variables to proper format
data$Date <- as.Date(data$Date,"%d/%m/%Y")

data$Global_active_power <- as.numeric(levels(data$Global_active_power))[data$Global_active_power]
data$Voltage <- as.numeric(levels(data$Voltage))[data$Voltage]
data$Global_intensity <- as.numeric(levels(data$Global_intensity))[data$Global_intensity]
data$Sub_metering_1 <- as.numeric(levels(data$Sub_metering_1))[data$Sub_metering_1]
data$Sub_metering_2 <- as.numeric(levels(data$Sub_metering_2))[data$Sub_metering_2]

#subset data by specified dates

date1 <- as.Date("2007-02-01")
date2 <- as.Date("2007-02-02")

subdata <- data[data$Date >= date1 & data$Date <= date2,]

#create table one with labels


library(datasets)

#create the plot

with(subdata, hist(Global_active_power, col = "red",
                   main = "Global Active Power",
                   xlab="Global Active Power (kilowatts)"))

#create the png file for submission

png("plot1.png")

with(subdata, hist(Global_active_power, col = "red",
                   main = "Global Active Power",
                   xlab="Global Active Power (kilowatts)"))

dev.off()



