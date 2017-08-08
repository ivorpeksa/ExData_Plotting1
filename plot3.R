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



#Plot 3
png(filename="plot3.png")
plot(myDF$DateTime,myDF$Sub_metering_1, lty=1, typ="l", xlab="", ylab="Energy sub metering", col="black")
points(myDF$DateTime,myDF$Sub_metering_2, lty=1, typ="l", xlab="", ylab="", col="red")
points(myDF$DateTime,myDF$Sub_metering_3, lty=1, typ="l", xlab="", ylab="", col="blue")
legend("topright", col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1))
#dev.copy(png, file="plot3.png")
dev.off()


