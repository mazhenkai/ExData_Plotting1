
setwd("F:/学术文档/上海大学研究生学习相关/网络课程学习/数据科学/数据推论课程/作业dir")

list.files()

fileurl<-"https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"

download.file(url = fileurl,destfile= "./Fhousehold_power_consumption.zip")

unzip(zipfile="./Fhousehold_power_consumption.zip") 

mydata<-read.table("household_power_consumption.txt",header=T,sep = ";")
head(mydata)


mydata[,1]<-as.Date(mydata[,1], "%d/%m/%Y")

mydata1 <- mydata[as.character(mydata$Date) %in% c("1/2/2007", "2/2/2007"),]

mydata1$dateTime = paste(mydata1$Date, mydata1$Time)

mydata1$dateTime <- strptime(mydata1$dateTime, "%d/%m/%Y %H:%M:%S")

attach(mydata1)

png("plot1.png", width=480, height=480, units="px")

png("plot2.png", width=480, height=480, units="px")
# Plot of Global active power minute by minute
Sys.setenv(LANG = "en")
plot(dateTime, as.numeric(as.character(Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
