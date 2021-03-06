# Plot1.R

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

# Plot 1

png(filename="Plot1.png", width=480, height=480, units="px")
hist(data$Global_active_power, main="Global Active Power",col='red', xlab="Global Active Power (kilowatts)")
dev.off()
