library(data.table)
f<-read.table("household_power_consumption.txt",sep=";",header=TRUE,fill=TRUE,stringsAsFactors=FALSE)
dt<-data.table(f,keep.rownames=TRUE)
dt2<-dt[Date=="1/2/2007" | Date=="2/2/2007"]
dt3<-paste(dt2$Date,dt2$Time)
dt4<-strptime(dt3,"%d/%m/%Y %H:%M:%S")
plot(dt4,dt2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png")
dev.off()
