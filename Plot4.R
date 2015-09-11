dt=read.csv("./household_power_consumption.txt", head=TRUE, sep=";")
dt=dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
dt$Global_active_power=as.numeric(as.character(dt$Global_active_power))
dt$Sub_metering_1=as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2=as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3=as.numeric(as.character(dt$Sub_metering_3))
dt$Global_reactive_power=as.numeric(as.character(dt$Global_reactive_power))
dt$Voltage=as.numeric(as.character(dt$Voltage))

# convert to date format
dt$DT=strptime(paste(dt$Date, " ", dt$Time), format="%d/%m/%Y  %H:%M:%S")
png("plot4.png", width=480, height=480)

par(mfrow=c(2,2))
#upper left
plot(dt$DT, dt$Global_active_power, type="l", xlab="", ylab="Global Active Power") 

#upper right
with(dt, plot(DT, Voltage, type="l", xlab="datetime")) 

#lower left
with(dt,         plot(DT, Sub_metering_1, xlab="", ylab="Energy sub metering", type="n"))
with(dt,   lines(DT, Sub_metering_1))
with(dt,   lines(DT, Sub_metering_2, col="red"))
with(dt,   lines(DT, Sub_metering_3, col="blue"))
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#lower right
with(dt, plot(DT, Global_reactive_power, type="l", xlab="datetime"))
dev.off
