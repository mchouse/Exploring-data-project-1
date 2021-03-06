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




#fix dates for remaining tables

subdata$datetime <- paste(subdata$Date, subdata$Time)

subdata$datetime <- strptime(subdata$datetim, format="%Y-%m-%d %H:%M:%S")

#create the plot

#subdata$datetimeday <- weekdays(subdata$datetime)


par(mfrow = c(2,2))

plot(subdata$datetime,subdata$Global_active_power, type="l"
     ,ylab="Global Active Power (kilowatts)",
     xlab="")
plot(subdata$datetime,subdata$Voltage, type="l",xlab ="datetime",ylab"Voltage")
plot(subdata$datetime,subdata$Sub_metering_1, type="l", col ="black",xlab="",ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, type="l", col ="red",xlab="",ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_3, type="l", col ="blue",ylab="Energy sub metering",
      xlab="")
legend("topright",pch = "_", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(subdata$datetime,subdata$Global_reactive_power,type="l",xlab ="datetime",ylab="Global reactive power")





#create the png file for submission

png("plot4.png")


par(mfrow = c(2,2))


plot(subdata$datetime,subdata$Global_active_power, type="l"
     ,ylab="Global Active Power (kilowatts)",
     xlab="")
plot(subdata$datetime,subdata$Voltage, type="l",xlab ="datetime",ylab="Voltage")
plot(subdata$datetime,subdata$Sub_metering_1, type="l", col ="black",xlab="",ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_2, type="l", col ="red",xlab="",ylab="Energy sub metering")
lines(subdata$datetime,subdata$Sub_metering_3, type="l", col ="blue",ylab="Energy sub metering",
      xlab="")
legend("topright",pch = "_", col=c("black","red","blue"),
       c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(subdata$datetime,subdata$Global_reactive_power,type="l",xlab ="datetime",ylab="Global reactive power")

dev.off()

