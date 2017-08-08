setwd("C:/Data Science/Datascience Pack/Johns Hopkins Data Science/wk4.1")
# Read in data
myDF <- read.table("C:/Data Science/Datascience Pack/Johns Hopkins Data Science/wk4.1/household_power_consumption.txt", sep=";", na.strings="?", header=TRUE)
tail(myDF)
str(myDF)

#Convert Date and Time to a single variable of DateTime in the DateTime format
myDF$DateTime <- strptime(paste(myDF$Date,myDF$Time), format = "%d/%m/%Y %T")
myDF[1:2] <- NULL

#Select only data from 2007-02-01 and 2007-02-02. This give us 2880 observations = 24hours*60mins*2days
myDF<-subset(myDF, myDF$DateTime>="2007-02-01" & myDF$DateTime<"2007-02-03")

#plot 4
png(filename="plot4.png")
par(mfcol = c(2,2))
plot(myDF$DateTime,myDF$Global_active_power, lty=1, typ="l", xlab="", ylab="Global Active Power")

plot(myDF$DateTime,myDF$Sub_metering_1, lty=1, typ="l", xlab="", ylab="Energy sub metering", col="black")
points(myDF$DateTime,myDF$Sub_metering_2, lty=1, typ="l", xlab="", ylab="", col="red")
points(myDF$DateTime,myDF$Sub_metering_3, lty=1, typ="l", xlab="", ylab="", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1), bty="n")

plot(myDF$DateTime,myDF$Voltage, lty=1, typ="l", xlab="datetime", ylab="Voltage")

plot(myDF$DateTime,myDF$Global_reactive_power, lty=1, typ="l", xlab="datetime", ylab="Global_reactive_power", col="black")
dev.off()
