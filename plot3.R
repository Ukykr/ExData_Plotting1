require(dplyr)


temp0 <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp0)
stuff <- read.table(unz(temp0, "household_power_consumption.txt"),sep = ";",header = T, na.strings = "?")
unlink(temp0)


data<-stuff%>%
        filter(Date=="1/2/2007"|Date=="2/2/2007")

x <- paste(data$Date, data$Time)%>%
        strptime(format="%d/%m/%Y %H:%M:%S")
graphics.off()

data1<-data%>%
        mutate(Date=NULL,Time=NULL)
data1$datetime<-x


png(filename="plot3.png")
plot(data1$datetime,data1$Sub_metering_1,type="l",ylab="Energy Sub Metering",col="black",xlab = "")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c('black','red','blue'))
dev.off()  
plot(data1$datetime,data1$Sub_metering_1,type="l",ylab="Energy Sub Metering",col="black",xlab = "")
lines(data1$datetime,data1$Sub_metering_2,col="red")
lines(data1$datetime,data1$Sub_metering_3,col="blue")
legend('topright','groups',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col=c('black','red','blue'))
