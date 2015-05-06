# Ploting graph 1

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
hist(data$Global_active_power, col="red", 
     main ="Global Active Power", 
     xlab="Global Active Power (kilowatts)")

# Copy the result to png file
dev.copy(png, file = "plot1.png")
dev.off()

