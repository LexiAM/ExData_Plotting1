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



## plot4.R script to plot a 4-panel plot of Global Active Power, Voltage, Energy submitering, Global_reactive_power
png(filename="plot4.png", width=480, height=480)

## 2x2 frame
par(mfrow=c(2,2))

### upperleft plot
plot(d$DateTime, d$Global_active_power, 
     type="l", 
     ylab = "Global Active Power (kilowatts)", 
     xlab="")

### upperright plot
plot(d$DateTime, d$Voltage,
     type="l", 
     ylab = "Voltage", 
     xlab="datetime",
     lwd=1)

### lowerleft plot
plot(d$DateTime,d[,7], 
     type="l", 
     ylab = "Energy sub metering", 
     xlab="", col=colors[1])
lines(d$DateTime,d[,8], 
      type="l", 
      col=colors[2])
lines(d$DateTime,d[,9], 
      type="l", 
      col=colors[3])
legend("topright", 
       names(d)[7:9], 
       border="black", 
       col= colors, lty=1, lwd=1)

### lowerright plot
plot(d$DateTime, d$Global_reactive_power,
    type="l",
    ylab = "Global_reactive_power", 
    xlab="datetime")
dev.off()





