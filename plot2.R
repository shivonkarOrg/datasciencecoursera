
setwd("D:/Projects/Analytics/CourseEra/DataScience/04_ExploratoryAnalysis")

memory_req <- 2075259 * 9 * 10 * 2 # Assuming each fied is 10 char length and each char will atke 2 bytes
memory_req <- memory_req / (10^6) #mb

Data <- read.table("household_power_consumption.txt",  sep = ";", header=TRUE,stringsAsFactors=FALSE, , na.strings = "?", dec = ".") # 
nrow(Data)
names(Data)
head(Data)

#datetime <- strptime(paste(Data$Date, Data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

Data$Date <- as.Date(Data$Date,"%d/%m/%Y") # dd/mm/yyyy
class(Data$Date) 
head(Data$Date) 

Data_Feb_1_2 <- subset(Data, Data$Date == as.Date("2007-02-01","%Y-%m-%d") | Data$Date == as.Date("2007-02-02","%Y-%m-%d") ) 
nrow(Data_Feb_1_2)
head(Data_Feb_1_2$Date)

Data_Feb_1_2_For_Graph <- Data_Feb_1_2[,c("Date","Time","Global_active_power")]
names(Data_Feb_1_2_For_Graph)
head(Data_Feb_1_2_For_Graph)
nrow(Data_Feb_1_2_For_Graph)

datetime <- strptime(paste(Data_Feb_1_2_For_Graph$Date, Data_Feb_1_2_For_Graph$Time, sep=" "), "%Y-%m-%d %H:%M:%S") 

Global_active_power_Num <- as.numeric(Data_Feb_1_2_For_Graph$Global_active_power)

png(filename = "plot2.png",  width = 480, height = 480, units = "px")
plot(datetime, Global_active_power_Num, main = "Global Active Power", type="l",ylab="Global Active Power (kilowatts)", xlab="")
dev.off()