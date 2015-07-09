
setwd("D:/Projects/Analytics/CourseEra/DataScience/04_ExploratoryAnalysis")

memory_req <- 2075259 * 9 * 10 * 2 # Assuming each fied is 10 char length and each char will atke 2 bytes
memory_req <- memory_req / (10^6) #mb

Data <- read.table("household_power_consumption.txt",  sep = ";", header=TRUE,stringsAsFactors=FALSE, , na.strings = "?", dec = ".") # 
nrow(Data)
names(Data)
head(Data)

Data$Date <- as.Date(Data$Date,"%d/%m/%Y") # dd/mm/yyyy
class(Data$Date) 
head(Data$Date) 

Data_Feb_1_2 <- subset(Data, Data$Date == as.Date("2007-02-01","%Y-%m-%d") | Data$Date == as.Date("2007-02-02","%Y-%m-%d") ) 
nrow(Data_Feb_1_2)

png(filename = "plot1.png",  width = 480, height = 480, units = "px")
hist(Data_Feb_1_2$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()