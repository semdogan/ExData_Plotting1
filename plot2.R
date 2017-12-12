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

#plot Global Active Power
plot(pow_sub$date_time,as.numeric(as.character(pow_sub$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)")

#save file
dev.copy(png, file = "plot2.png", height = 480, width = 480)
dev.off()
