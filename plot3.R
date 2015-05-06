# Ploting graph 3

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
par(mar=c(5,4,2,3))
plot(data$Sub_metering_1, type="n", ylab="Energy sub mettering", xlab="",  xaxt = "n")
lines(data$Sub_metering_1, type="l")
lines(data$Sub_metering_2, type="l", col="red")
lines(data$Sub_metering_3, type="l", col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", lty=1, pt.cex=5, cex=0.8, 
       col = c("black", "red", "blue"), 
       legend = c(" Sub_metering_1", " Sub_metering_2", " Sub_metering_3"))

# Copy the result to png file
dev.copy(png, file = "plot3.png")
dev.off()

