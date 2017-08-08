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

#Plot 1
par(mfcol = c(1,1))
hist(myDF$Global_active_power,col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()

