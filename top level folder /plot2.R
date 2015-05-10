# first get the full dataset
data_full<-read.csv("./Analytical/household_power_consumption.txt",header=T,sep=';',na.strings="?",
                    nrows=2075259,check.names=F,comment.char="",quote='\"')
# COnverting the dates to a Date format
data_full$Date<-as.Date(data_full$Date,format="%d/%m/%Y")

# now extract the data of only the two days we need...
data<-subset(data_full,subset=(Date>="2007-02-01"&Date<="2007-02-02"))
rm(data_full)  ##get rid of data_full

# convert dates and time
datetime<-paste(as.Date(data$Date),data$Time)
data$Datetime<-as.POSIXct(datetime)

# make plot2
plot(data$Global_active_power~data$Datetime,type="l",
     ylab="Global Active Power(kilowatts)",xlab="")
# copy plot to a png file
dev.copy(png,file="plot2.png")
dev.off()


            