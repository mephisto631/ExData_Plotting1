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

# Making plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0),mgp=c(2,1,0))
with(data, {
        par(ps=8,cex=1,cex.main=1)
        plot(Global_active_power~Datetime, type="l", ##plot1
             ylab="Global Active Power", xlab="")
        plot(Voltage~Datetime, type="l",   ##plot2
             ylab="Voltage", xlab="datetime")
        plot(Sub_metering_1~Datetime, type="l",  ##plot3
             ylab="Energy sub metering", xlab="")
        lines(Sub_metering_2~Datetime,col='Red')
        lines(Sub_metering_3~Datetime,col='Blue')
        legend("topright", col=c("black", "red", "blue"), lty=1, lwd=1, bty="n",
               x.intersp=0.5, y.intersp=0.5,
               legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
        plot(Global_reactive_power~Datetime, type="l",  ##plot4
             ylab="Global_reactive_power",xlab="datetime")
})

## save the plot
dev.copy(png,file="plot4.png")
dev.off()