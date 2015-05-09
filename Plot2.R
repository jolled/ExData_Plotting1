#Read File (make sure the file is in current directory)
household_PC <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?")

#Create a datetime column
x<-paste(household_PC$Date, household_PC$Time, sep = " ")
y<-strptime(x,format="%d/%m/%Y %H:%M:%S")
household_PC$datetime<-as.POSIXct(y)

#Change Date column type, from text to Date
household_PC$Date <- as.Date(household_PC$Date, format="%d/%m/%Y")

#Extract the intresting dates 
data <- subset(household_PC, Date >= "2007-02-01" & Date <= "2007-02-02")

## Plot 2
par(bg="transparent")
plot(data$Global_active_power~data$datetime, 
     ylab="Global Active Power (kilowatts)", 
     xlab="",
     type="l")

#Save to file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()