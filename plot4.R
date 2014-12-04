#read the data
epc<-read.table("D:/Dropbox/Datum/07.DSS/04 Exploratory Data Analysis/cpj1/household_power_consumption.txt",sep=";",header = T)
#combine the Date and Time into Datetime and format it
epc1<-data.frame(strptime(paste(as.character(epc$Date),as.character(epc$Time)),format = "%d/%m/%Y %H:%M:%S"),
                 epc$Global_active_power,epc$Global_reactive_power,epc$Voltage,epc$Global_intensity,
                 epc$Sub_metering_1,epc$Sub_metering_2,epc$Sub_metering_3)

#assign the column names
colnames(epc1)<-c("DateTime","Global_active_power","Global_reactive_power","Voltage","Global_intensity",
                  "Sub_metering_1","Sub_metering_2","Sub_metering_3")

#filter the data need
epc2<-epc1[epc1$DateTime < "2007-02-03"& epc1$DateTime >="2007-02-01",]

#setup par's parameter
par(mfrow = c(2, 2),oma = c(0,0,0,0),mar = c(4,4,4,4),ps = 10)
#plot 1
with(epc2,plot(DateTime,as.numeric(as.character(Global_active_power)),type = "l",
               xlab = "",ylab="Global Active Power(kilowatts)"))
#plot 2
with(epc2,plot(DateTime,as.numeric(as.character(Voltage)),type = "l",
               xlab = "Datetime",ylab="Voltage"))
#plot 3
with(epc2,plot(DateTime,as.numeric(as.character(Sub_metering_1)),type = "l",xlab = "",ylab = "Energy Sub metering"))
with(epc2,points(DateTime,as.numeric(as.character(Sub_metering_2)),type = "l",col="red"))
with(epc2,points(DateTime,as.numeric(as.character(Sub_metering_3)),type = "l",col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1,col=c("black","red","blue"),seg.len = 1,bg = "transparent",bty = "n",x.intersp=1,text.width = 80000)
#plot 4
with(epc2,plot(DateTime,as.numeric(as.character(Global_reactive_power)),type = "l",
               xlab = "Datetime",ylab="Global reactive Power"))