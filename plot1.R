
power_consume <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

power_consume$Date <- strptime(power_consume$Date, "%d/%m/%Y")

power_select <- subset(power_consume, Date=="2007-02-01 MYT" | Date=="2007-02-02 MYT")
                         
hist(power_select$Global_active_power, col="red", 
     main="Global Active Power", xlab="Global Active Power (kilowatts)", 
     cex.axis=0.8, cex.lab=0.8, cex.main=0.8)

dev.copy(png, file="plot1.png")
dev.off()
