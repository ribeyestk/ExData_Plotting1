library(utils)
unzip("exdata_data_household_power_consumption.zip", exdir = "Data_Plotting")
Electric_Power_Consumption <- read.csv("Data_Plotting/household_power_consumption.txt", sep = ";", header = TRUE)
Electric_Power_Consumption_Short <- subset(Electric_Power_Consumption, Date %in% c("1/2/2007", "2/2/2007"))
Electric_Power_Consumption_Short$Date <- as.Date(Electric_Power_Consumption_Short$Date, format = "%d/%m/%Y")  
datetime <- paste(as.Date(Electric_Power_Consumption_Short$Date) ,Electric_Power_Consumption_Short$Time)
Electric_Power_Consumption_Short$Datetime <- as.POSIXct(datetime)

with(Electric_Power_Consumption_Short, {
  plot(Global_active_power~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
})
