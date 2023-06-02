library(utils)
unzip("exdata_data_household_power_consumption.zip", exdir = "Data_Plotting")
Electric_Power_Consumption <- read.csv("Data_Plotting/household_power_consumption.txt", sep = ";", header = TRUE)
Electric_Power_Consumption$Date <- as.Date(Electric_Power_Consumption$Date, format = "%d/%m/%Y")  # Convert Date column to Date format
Electric_Power_Consumption_Short <- subset(Electric_Power_Consumption, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
Global_Active_Power <- as.numeric(Electric_Power_Consumption_Short$Global_active_power)

hist(Global_Active_Power, col = "blue", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
