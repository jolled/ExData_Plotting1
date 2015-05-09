#Read File (make sure the file is in current directory)
household_PC <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Create a datetime column
x<-paste(household_PC$Date, household_PC$Time, sep = " ")
y<-strptime(x,format="%d/%m/%Y %H:%M:%S")
household_PC$datetime<-as.POSIXct(y)

#Change Date column type, from text to Date
household_PC$Date <- as.Date(household_PC$Date, format="%d/%m/%Y")

#Extract the intresting dates 
data <- subset(household_P, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 4
par(mfcol=c(2,2),mar=c(4,4,2,1), oma=c(0,0,2,0), bg="transparent")
plot(data$Global_active_power~data$datetime, type="l", 
     ylab="Global Active Power", xlab="")

plot(data$Sub_metering_1~data$datetime, ylab="Energy sub metering", xlab="", type="l")
lines(data$Sub_metering_2~data$datetime,col='Red')
lines(data$Sub_metering_3~data$datetime,col='Blue')
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=1, lwd=2, bty="n")

plot(data$Voltage~data$datetime, type="l", 
     ylab="Voltage", xlab="datetime")

plot(data$Global_reactive_power~data$datetime, type="l", 
     ylab="Global_reactive_power",xlab="datetime")

## Saving to file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
