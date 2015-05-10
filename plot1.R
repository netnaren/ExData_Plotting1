utydata = read.table("household_power_consumption.txt", header=T,  sep = ";")
utydata$Date <- as.Date(utydata$Date, "%d/%m/%Y")
utydata$Global_active_power <- as.numeric(utydata$Global_active_power)
head(utydata)

startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")

reportdata <- utydata[utydata$Date >= startDate & utydata$Date <= endDate,]
head(reportdata)
hist(reportdata$Global_active_power, col = "red")
