library(data.table)

dt = fread("household_power_consumption.txt",na.strings=c("?","NA"))
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
dt_subset <- subset(dt, dt$Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")))

png("plot2.png", width=480, height=480, units="px")

times <- as.POSIXct(paste(dt_subset$Date,dt_subset$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

plot(times, dt_subset$Global_active_power,type="n", ylab="Global Active Power (kilowatts)",xlab="")
lines(times, dt_subset$Global_active_power)

dev.off()