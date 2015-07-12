data_epc <- read.table("household_power_consumption.txt", sep = ";",header = TRUE )
data_epc$Date <- strptime(data_epc$Date,format = "%d/%m/%Y")
data_epc_subset <- subset(data_epc,
                          data_epc$Date >= strptime("01/02/2007", format ="%d/%m/%Y" ) &
                          data_epc$Date <= strptime("02/02/2007",format ="%d/%m/%Y"))
data_epc_subset$Global_active_power<- 
  ifelse(data_epc_subset$Global_active_power == "?" ,NA,data_epc_subset$Global_active_power)
png(filename = "plot1.png",width = 480, height = 480, units =  "px")
with(data_epc_subset, hist(data_epc_subset$Global_active_power/1000, main = "Global Active Power",col = "Red", breaks = 13, 
                           xlab = "Global Active Power (Killowatts)", 
))

dev.off()


