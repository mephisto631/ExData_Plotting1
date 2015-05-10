data<-file("./Analytical/household_power_consumption.txt")
# try to extract only the 1/2/2007 and 2/2/2007 lines with grep function. 
el<-read.table(text=grep("^[1,2]/2/2007",readLines(data),value=TRUE),col.names=c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep=";",header=TRUE)
# make histogram and save as a png file.
hist(el$Global_active_power,col="red", main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.copy(png,file="plot1.png")     
dev.off()

