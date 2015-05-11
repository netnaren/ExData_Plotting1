utydata = read.table("household_power_consumption.txt", header=T,  sep = ";")
utydata$Date <- as.Date(utydata$Date, "%d/%m/%Y")
utydata$Global_active_power <- as.numeric(utydata$Global_active_power)

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

reportdata <- utydata[utydata$Date >= startDate & utydata$Date <= endDate,]
reportdata$Time <- paste(reportdata$Date, reportdata$Time)
reportdata$Time <- strptime(reportdata$Time, "%Y-%m-%d %H:%M:%S") 

png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(reportdata$Time, reportdata$Global_active_power, type="l" , xlab="", ylab="Global Active Power (kilowatts)",main=NULL)
dev.off()