download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
data<-read.csv('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")
data_subs <- subset(data, as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")
png("plot4.png")
par(bg="transparent")

par(mfcol=c(2,2))
#plot 1
par(col="black")
plot(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="",type="n")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_active_power, type="l")
#plot 2
par(col="black")
plot(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),
     pmax(data_subs$Sub_metering_1,data_subs$Sub_metering_2,data_subs$Sub_metering_3),
     ylab="Energy sub metering", xlab="",type="n")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Sub_metering_1, type="l")
par(col="red")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Sub_metering_2, type="l")
par(col="blue")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Sub_metering_3, type="l")
par(col="black")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3") , col=c("black","red","blue"), lty=c(1,1),  bty="n")
#plot 3
par(col="black")
plot(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Voltage,
     ylab="Voltage", xlab="datetime",type="n")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Voltage, type="l")
#plot 4
par(col="black")
plot(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_reactive_power,
     ylab="Global_reactive_power", xlab="datetime",type="n")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_reactive_power, type="l")
dev.off()