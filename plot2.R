## script to read in "household_power_consumption.txt" located in working directory
## convert 1st column "Date" into Date format
## subset only data between start.Date and end.Date
## add d$DateTime column that combines Date and Time as a datetime variable

d <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings="?")
d$Date <- as.Date(as.character(d$Date), "%d/%m/%Y")
start.Date <- as.Date(c("2007-02-01"))
end.Date <- as.Date(c("2007-02-02"))
d <- d[(d$Date >= start.Date) & (d$Date <= end.Date), ]
d$DateTime <- as.POSIXct(paste(d$Date, as.character(d$Time)), format="%Y-%m-%d %H:%M:%S")


## plot2.R script to plot Global Activer Power as a function of time
## and save into "plot2.png" file 480x480 pixels

png(filename="plot2.png", width=480, height=480)
plot(d$DateTime,d$Global_active_power, 
          type="l", 
          ylab = "Global Active Power (kilowatts)", 
          xlab="")
dev.off()
