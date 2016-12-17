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


 
png(filename="plot1.png")
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()           
hist(data1$Global_active_power,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
