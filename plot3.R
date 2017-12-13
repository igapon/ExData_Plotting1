library(data.table)

dt = fread("household_power_consumption.txt",na.strings=c("?","NA"))
dt$Date <- as.Date(dt$Date,"%d/%m/%Y")
dt_subset <- subset(dt, dt$Date %in% c(as.Date("01/02/2007","%d/%m/%Y"),as.Date("02/02/2007","%d/%m/%Y")))

png("plot3.png", width=480, height=480, units="px")

times <- as.POSIXct(paste(dt_subset$Date,dt_subset$Time, sep=" "),format="%Y-%m-%d %H:%M:%S")

plot(times, dt_subset$Sub_metering_1,type="n", ylab="Energy sub metering",xlab="")
lines(times, dt_subset$Sub_metering_1, col="black")
lines(times, dt_subset$Sub_metering_2, col="red")
lines(times, dt_subset$Sub_metering_3, col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black","red","blue"), lwd=c(1,1,1)) 

dev.off()