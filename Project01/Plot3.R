# Plot3.R

power.data=read.table("household_power_consumption.txt", header=TRUE, sep=";")

# Keep power data unchanged, work only in workdata dataframe

workdata = power.data

workdata$Date = as.character(workdata$Date)
workdata$Date = as.Date(workdata$Date, format = "%d/%m/%Y")
workdata$Time = as.character(workdata$Time)
data=subset(workdata, Date=="2007-02-01" | Date=="2007-02-02")

#convert to numeric all factors

for (i in 3:9){
  data[,i]=as.numeric(as.character(data[,i]))  
}

# create datetime series for plots

data$datetime = strptime(paste(data$Date, data$Time), format="%Y-%m-%d %T")

png(filename="Plot3.png", width=480, height=480, units="px")
with(data, plot(datetime,Sub_metering_1,"l",xlab="", ylab="Energy sub metering"))
with(data, lines(datetime,Sub_metering_2, col="red"))
with(data, lines(datetime,Sub_metering_3,col="blue"))
legend(x="topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))
dev.off()