#Reading and subsetting power consumption data

pow = read.table(
  file="household_power_consumption.txt", 
  header=TRUE, 
  fill = TRUE, 
  as.is=TRUE,
  sep=";", comment.char = "",
  quote = "" )

#subset data
pow$Date <- as.Date(pow$Date, "%d/%m/%Y")
pow_sub <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02", ]


#convert the Date and Time variables 
pow_sub$date_time <- strptime(paste(pow_sub$Date, pow_sub$Time), "%Y-%m-%d %H:%M:%S")

#Plot4

par(mfrow = c(2, 2)) 

plot(pow_sub$date_time,as.numeric(as.character(pow_sub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

plot(pow_sub$date_time, as.numeric(as.character(pow_sub$Voltage)), type="l", xlab="datetime", ylab="Voltage")

plot(pow_sub$date_time, pow_sub$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(pow_sub$date_time, pow_sub$Sub_metering_2, type="l", col="red")
lines(pow_sub$date_time, pow_sub$Sub_metering_3, type="l", col="blue")
legend("topright",cex = 0.6, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

plot(pow_sub$date_time, as.numeric(as.character(pow_sub$Global_reactive_power)),type="l",xlab="",ylab="Global_reactive_power")

#save plot 4
dev.copy(png, file = "plot4.png", height = 480, width = 480)
dev.off()
