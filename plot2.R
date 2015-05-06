# Ploting graph 2

# Initialize environment
Sys.setlocale("LC_TIME", "USA")
library(dplyr)
library(tidyr)
library(lubridate)
library(sqldf)

# Reading the relevant rows from the provided data 
# And converting date to date variable
file<-"household_power_consumption.txt"
data<-read.csv.sql(file, header=T, sep=";", sql = "select * from file where Date='1/2/2007' OR Date='2/2/2007'")
data<-mutate(data, Date = as.Date(Date, format="%d/%m/%Y"))

# Plotting required figure
plot(data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="",  xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# Copy the result to png file
dev.copy(png, file = "plot2.png")
dev.off()

