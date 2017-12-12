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

#Base plot function
hist(as.numeric(as.character(pow_sub$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

#Save file
dev.copy(png, file = "plot1.png", height = 480, width = 480)
dev.off()
