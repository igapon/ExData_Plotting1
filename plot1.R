library(data.table)

dt = fread("household_power_consumption.txt",na.strings=c("?","NA"))
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
dt_subset <- subset(dt, dt$Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")))

png("plot1.png", width=480, height=480, units="px")

hist(dt_subset$Global_active_power, col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")

dev.off()