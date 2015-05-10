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

# Making plot3
with(data,{
        plot(Sub_metering_1~Datetime,type="l", #plot y vs x
             ylab="Energy sub metring",xlab="") # define y and x axis using line()
        lines(Sub_metering_2~Datetime,col='Red')  # change color of variables, default color is black
        lines(Sub_metering_3~Datetime,col='Blue')
        par(ps=8,cex=1,cex.main=1)
})
legend("topright",col=c("black","red","blue"),lty=1,lwd=1,  # add fogure legend on top right corner
       x.intersp=0.5,y.intersp=0.5,legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))


# save to a png file
dev.copy(png,file="plot3.png")
dev.off()

