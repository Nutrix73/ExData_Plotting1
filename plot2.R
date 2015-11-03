
power_consume <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

power_consume$Date <- strptime(power_consume$Date, "%d/%m/%Y")
power_select <- subset(power_consume, Date=="2007-02-01" | Date=="2007-02-02")

power_select$Fulldate <- paste(power_select$Date, power_select$Time)
power_select$Fulldate <- strptime(power_select$Fulldate, "%Y-%m-%d  %H:%M:%S")

with(power_select, plot(Fulldate,Global_active_power, type="l",
                        xlab="", ylab="Global Active Power (kilowatts)",
                        cex.axis=0.8, cex.lab=0.8 ))

dev.copy(png, file="plot2.png")
dev.off()
