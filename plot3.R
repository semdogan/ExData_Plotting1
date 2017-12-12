#Reading and subsetting power consumption data

pow = read.table(
  file="household_power_consumption.txt", 
  header=TRUE, 
  fill = TRUE, 
  as.is=TRUE,
  sep=";", comment.char = "",
  quote = "" )

#subset data
pow_sub <- pow[pow$Date == "2007-02-01" | pow$Date == "2007-02-02", ]


#convert the Date and Time variables 
pow_sub$date_time <- strptime(paste(pow_sub$Date, pow_sub$Time), "%Y-%m-%d %H:%M:%S")

#plot Energy Submetering
plot(pow_sub$date_time, as.numeric(pow_sub$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(pow_sub$date_time, as.numeric(pow_sub$Sub_metering_2), type="l", col="red")
lines(pow_sub$date_time, as.numeric(pow_sub$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#save plot
dev.copy(png, file = "plot33.png", height = 480, width = 480)
dev.off()