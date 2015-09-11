dt=read.csv("./household_power_consumption.txt", head=TRUE, sep=";")
dt=dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
dt$Global_active_power=as.numeric(as.character(dt$Global_active_power))
dt$Sub_metering_1=as.numeric(as.character(dt$Sub_metering_1))
dt$Sub_metering_2=as.numeric(as.character(dt$Sub_metering_2))
dt$Sub_metering_3=as.numeric(as.character(dt$Sub_metering_3))
# convert to date format
dt$DT=strptime(paste(dt$Date, " ", dt$Time), format="%d/%m/%Y  %H:%M:%S")
png("plot3.png", width=480, height=480)

with(dt,         plot(DT, Sub_metering_1, xlab="", ylab="Energy Sub Metering", type="n"))
with(dt,   lines(DT, Sub_metering_1))
with(dt,   lines(DT, Sub_metering_2, col="red"))
with(dt,   lines(DT, Sub_metering_3, col="blue"))
legend("topright", pch="-", col=c("black","red","blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off
