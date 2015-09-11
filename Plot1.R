dt=read.csv("./household_power_consumption.txt", head=TRUE, sep=";")
dt=dt[dt$Date=="1/2/2007" | dt$Date=="2/2/2007",]
dt$Global_active_power=as.numeric(as.character(dt$Global_active_power))

#plot
png("plot1.png", width=480, height=480)
hist(dt$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off

