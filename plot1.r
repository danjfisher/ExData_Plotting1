library(data.table)
f<-read.table("household_power_consumption.txt",sep=";",header=TRUE,fill=TRUE,stringsAsFactors=FALSE)
dt<-data.table(f,keep.rownames=TRUE)
dt2<-dt[Date=="1/2/2007" | Date=="2/2/2007"]
hist(as.numeric(dt2$Global_active_power),col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.copy(png,file="plot1.png")
dev.off()

