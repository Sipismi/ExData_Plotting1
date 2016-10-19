setwd("~/ExData_Plotting1")

#Read the data from working directory to R. The na.string is set to match the data. 
data <- read.table("household_power_consumption.txt", sep=";", header = TRUE, na.strings="?")

#Load some handy libaries to re-shape the data
library("dplyr")
library("lubridate")

#Define the interval as instructed in the documentation
startDate <- ymd_hms("2007-02-01 00:00:00")
endDate <- ymd_hms("2007-02-02 23:59:59")

#Fix the dates from factors to date object and combine time and date to single object for nice plotting. And select the data from
#the specified dates. 
febData <-data %>% mutate(Date = dmy(Date)) %>% 
    mutate(Time = hms(Time)) %>% 
    mutate(dateTime = as.POSIXct(Date+Time)) %>%
    filter(dateTime >=startDate & dateTime <= endDate)

#Draw the plot based on the visual reference. 
png("plot1.png", height=480, width = 480, units = "px")
with(febData, hist(Global_active_power, col = "red", xlab="Global active Power (kilowatts)", main = "Global Active Power"))
dev.off()
