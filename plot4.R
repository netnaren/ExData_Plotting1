utydata = read.table("household_power_consumption.txt", header=T,  sep = ";")
utydata$Date <- as.Date(utydata$Date, "%d/%m/%Y")
utydata$Global_active_power <- as.numeric(utydata$Global_active_power)
utydata$Voltage <- as.numeric(utydata$Voltage)
utydata$Global_reactive_power <- as.numeric(utydata$Global_reactive_power)

utydata$Sub_metering_1 <- as.numeric(utydata$Sub_metering_1)
utydata$Sub_metering_2 <- as.numeric(utydata$Sub_metering_2)
utydata$Sub_metering_3 <- as.numeric(utydata$Sub_metering_3)

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

reportdata <- utydata[utydata$Date >= startDate & utydata$Date <= endDate,]
reportdata$Time <- paste(reportdata$Date, reportdata$Time)
reportdata$Time <- strptime(reportdata$Time, "%Y-%m-%d %H:%M:%S") 

png(filename = "plot4.png", width = 480, height = 480, units = "px")

old.par <- par(mfrow=c(2, 2))

plot(reportdata$Time, reportdata$Global_active_power, type="l" , xlab="", ylab="Global Active Power",main=NULL)

plot(reportdata$Time, reportdata$Voltage, type="l" , xlab="datetime", ylab="Voltage",main=NULL)

plot(reportdata$Time, reportdata$Sub_metering_1, type="l" , xlab="", ylab="Energy sub metering",main=NULL, col = "black")
lines(reportdata$Time, reportdata$Sub_metering_2, type="l" , col = "red")
lines(reportdata$Time, reportdata$Sub_metering_3, type="l" , col = "blue")

legendText <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")             
legend('topright', legendText,  lty=1, col=c('black', 'red', 'blue'), bty="n")

plot(reportdata$Time, reportdata$Global_reactive_power, type="l" , xlab="datetime", ylab="Global_reactive_power",main=NULL)

par(old.par)

dev.off()