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

#draw the hist output
hist(as.numeric(as.character(epc2$Global_active_power)),col="red",freq = T,main = 
       "Global Active Power",xlab = "Global Active Power(kilowatts)")