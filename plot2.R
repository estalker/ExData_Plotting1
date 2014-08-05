download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              destfile="exdata_data_household_power_consumption.zip")
unzip("exdata_data_household_power_consumption.zip")
data<-read.csv('household_power_consumption.txt', header = TRUE, sep = ";", na.strings = "?")
data_subs <- subset(data, as.Date(data$Date,"%d/%m/%Y")>="2007-02-01" & as.Date(data$Date,"%d/%m/%Y")<="2007-02-02")
png("plot2.png")
par(bg="transparent")
plot(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_active_power,
     ylab="Global Active Power (kilowatts)", xlab="",type="n")
lines(strptime(paste(data_subs$Date,data_subs$Time,sep=" "), "%d/%m/%Y %H:%M:%S"),data_subs$Global_active_power, type="l")
dev.off()