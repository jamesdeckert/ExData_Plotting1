dt=read.csv("./household_power_consumption.txt", head=TRUE, sep=";")
dt=dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
dt$Global_active_power=as.numeric(as.character(dt$Global_active_power))
# convert to date format
dt$DT=strptime(paste(dt$Date, " ", dt$Time), format="%d/%m/%Y  %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(dt$DT, dt$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 
dev.off

