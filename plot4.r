library(data.table)
f<-read.table("household_power_consumption.txt",sep=";",header=TRUE,fill=TRUE,stringsAsFactors=FALSE)
dt<-data.table(f,keep.rownames=TRUE)
dt2<-dt[Date=="1/2/2007" | Date=="2/2/2007"]
dt3<-paste(dt2$Date,dt2$Time)
dt4<-strptime(dt3,"%d/%m/%Y %H:%M:%S")
par(mfrow=c(2,2),ps=10)
plot(dt4,dt2$Global_active_power,type="l",xlab="",ylab="Global Active Power")
plot(dt4,dt2$Voltage,type="l",xlab="datetime",ylab="Voltage")
plot(dt4,dt2$Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
lines(dt4,dt2$Sub_metering_2,type="l",col="red")
lines(dt4,dt2$Sub_metering_3,type="l",col="blue")
legend("topright",bty="n",lty=c(1,1,1),lwd=c(1,1,1),col=c("black","red","blue"),c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
plot(dt4,dt2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
dev.copy(png,file="plot4.png")
dev.off()