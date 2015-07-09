
setwd("D:/Projects/Analytics/CourseEra/DataScience/04_ExploratoryAnalysis")

Data <- read.table("household_power_consumption.txt",  sep = ";", header=TRUE,stringsAsFactors=FALSE, , na.strings = "?", dec = ".") # 
names(Data)

Data$Date <- as.Date(Data$Date,"%d/%m/%Y") # dd/mm/yyyy
Data_Feb_1_2_For_Graph <- subset(Data, Data$Date == as.Date("2007-02-01","%Y-%m-%d") | Data$Date == as.Date("2007-02-02","%Y-%m-%d") ) 

datetime <- strptime(paste(Data_Feb_1_2_For_Graph$Date, Data_Feb_1_2_For_Graph$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

png(filename = "plot4.png",  width = 480, height = 480, units = "px")

par(mfrow = c(2,2))

Global_active_power_Num <- as.numeric(Data_Feb_1_2_For_Graph$Global_active_power)
plot(datetime, Global_active_power_Num, type="l", ylab="Global active power", xlab="")


Voltage_Num <- as.numeric(Data_Feb_1_2_For_Graph$Voltage)
plot(datetime, Voltage_Num, type="l", ylab="Voltage", xlab="")


Sub_metering_1_Num <- as.numeric(Data_Feb_1_2_For_Graph$Sub_metering_1)
Sub_metering_2_Num <- as.numeric(Data_Feb_1_2_For_Graph$Sub_metering_2)
Sub_metering_3_Num <- as.numeric(Data_Feb_1_2_For_Graph$Sub_metering_3)
plot(datetime, Sub_metering_1_Num, type="l", col = "grey", ylab="Energy Submetering", xlab="")
lines(datetime, Sub_metering_2_Num, type="l",col = "red")
lines(datetime, Sub_metering_3_Num, type="l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

Global_reactive_power_Num <- as.numeric(Data_Feb_1_2_For_Graph$Global_reactive_power)
plot(datetime, Global_reactive_power_Num, type="l", ylab="Global_reactive_power", xlab="")

dev.off()