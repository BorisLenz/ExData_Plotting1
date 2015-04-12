################################################################################
# Course: Exploratory Data Analysis                                            #
# Author: Boris Lenz                                                           #
# Task: Programming Assignment 1, Part 2                                       #
# Date: 2015-04-12                                                             #
################################################################################

# set language to English
Sys.setlocale(locale="English")

# read the source data
unzip("exdata_data_household_power_consumption.zip")
mydata <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

# subset to only data from 1/2/2007 and 2/2/2007
mydata <- mydata[mydata$Date %in% c('1/2/2007', '2/2/2007'), ]

# create new column with date and time combined
mydata$DateTime <- paste(mydata$Date, mydata$Time)

# convert new DateTime column to POSIXlt
mydata$DateTime <- strptime(mydata$DateTime, format="%d/%m/%Y %H:%M:%S")

# create plot
png(filename="plot2.png", width=480, height=480)
plot(mydata$DateTime, mydata$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
