library(utils)
unzip("exdata_data_household_power_consumption.zip", exdir = "Data_Plotting")
Electric_Power_Consumption <- read.csv("Data_Plotting/household_power_consumption.txt", sep = ";", header = TRUE)
Electric_Power_Consumption_Short <- subset(Electric_Power_Consumption, Date %in% c("1/2/2007", "2/2/2007"))
Electric_Power_Consumption_Short$Date <- as.Date(Electric_Power_Consumption_Short$Date, format = "%d/%m/%Y")  
datetime <- paste(as.Date(Electric_Power_Consumption_Short$Date) ,Electric_Power_Consumption_Short$Time)
Electric_Power_Consumption_Short$Datetime <- as.POSIXct(datetime)

par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(Electric_Power_Consumption_Short, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

