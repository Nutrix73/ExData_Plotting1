
power_consume <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")

power_consume$Date <- strptime(power_consume$Date, "%d/%m/%Y")
power_select <- subset(power_consume, Date=="2007-02-01" | Date=="2007-02-02")

power_select$Fulldate <- paste(power_select$Date, power_select$Time)
power_select$Fulldate <- strptime(power_select$Fulldate, "%Y-%m-%d  %H:%M:%S")


par(mfrow = c(2,2), mar = c(4,4,2,1))

# figure 1
with(power_select, plot(Fulldate,Global_active_power, type="l",
                        xlab="", ylab="Global Active Power",
                        cex.axis=0.8, cex.lab=0.8 ))

# figure 2
with(power_select, plot(Fulldate,Voltage, type="l",
                        xlab="datetime", ylab="Voltage",
                        cex.axis=0.8, cex.lab=0.8 ))

# figure 3
with(power_select, plot(Fulldate,Sub_metering_1, type="l",
                        xlab="", ylab="Energy sub metering",
                        cex.axis=0.8, cex.lab=0.8 ))

with(power_select, lines(Fulldate,Sub_metering_2, col="red"))
with(power_select, lines(Fulldate,Sub_metering_3, col="blue"))

legend("topright", lty=c(1,1), col=c("black","red","blue"), cex=0.5, bty="n",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3") )


# figure 4
with(power_select, plot(Fulldate,Global_reactive_power, type="l",
                        xlab="datetime", ylab="Global_reactive_power",
                        cex.axis=0.8, cex.lab=0.8 ))

dev.copy(png, file="plot4.png")
dev.off()

