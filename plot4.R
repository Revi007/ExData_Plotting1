# Ploting graph 4

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

# Setting the canvas
par(mfrow=c(2,2))
par(mar= c(4,4,3,2))

# Plotting top left graph
plot(data$Global_active_power, type="l", ylab="Global Active Power", xlab="",  xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# Plotting top right graph
plot(data$Voltage, type="l", ylab="Voltage", xlab="datetime",  xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# Plotting bottom left graph
plot(data$Sub_metering_1, type="n", ylab="Energy sub mettering", xlab="",  xaxt = "n")
lines(data$Sub_metering_1, type="l")
lines(data$Sub_metering_2, type="l", col="red")
lines(data$Sub_metering_3, type="l", col="blue")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))
legend("topright", bty="n",lty=1,pt.cex=5, cex=0.7, 
       col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Plotting bottom right graph
plot(data$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime",  xaxt = "n")
axis(1, at=c(0,1440,2880), labels=c("Thu","Fri","Sat"))

# Copy the result to png file
dev.copy(png, file = "plot4.png")
dev.off()

