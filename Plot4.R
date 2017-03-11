#save the file path in a variable for ease of use

> dataLocation <- "C:/Users/ghb206/Downloads/exdata%2Fdata%2Fhousehold_power_consumption/household_power_consumption.txt"

#read the file in

> powerConsumption <- read.table(dataLocation,header  = TRUE,sep=";",na.strings = "?")

#subset the file per the specified dates that are being analyzed

> subsetPowerConsumption <- subset(powerConsumption,powerConsumption$Date=="1/2/2007" | powerConsumption$Date =="2/2/2007")

#correct for the data being read as a factor prior to hist building

> subsetPowerConsumption$Global_active_power <- as.numeric(as.character(subsetPowerConsumption$Global_active_power))

#consolidate Date and Time cols into new col in order to build plot

> subsetPowerConsumption$DateTimeConsol <-paste(subsetPowerConsumption$Date, subsetPowerConsumption$Time)

#correct for factors in the Sub_metering_x cols

> subsetPowerConsumption$Sub_metering_1 <- as.numeric(as.character(subsetPowerConsumption$Sub_metering_1))
> subsetPowerConsumption$Sub_metering_2 <- as.numeric(as.character(subsetPowerConsumption$Sub_metering_2))
> subsetPowerConsumption$Sub_metering_3 <- as.numeric(as.character(subsetPowerConsumption$Sub_metering_3))

#correct for factors in voltage col

> subsetPowerConsumption$Voltage <- as.numeric(as.character(subsetPowerConsumption$Voltage))

#set plot window up with 2 x 2, read down in col orientation

> par(mfcol = c(2,2))

#create 4 plots with labelling

> plot(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "GlobalActivePower")
 
> plot(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Sub_metering_1, type = "l", xlab = "", ylab = "Energysubmetering")

> lines(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Sub_metering_2, type = "l", col = "red" )
 
> lines(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Sub_metering_3, type = "l", col = "blue" )

> legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

> plot(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Voltage, type = "l", 
      xlab = "datetime", ylab = "Voltage")
> plot(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Global_reactive_power, type = "l", 
      xlab = "datetime", ylab = "Global_reactive_power")

#confirm working directory for png write

> getwd()
[1] "C:/Users/ghb206/Documents"

#open device and write png to wd 

> dev.copy(png, file="Plot4.png", height=480, width=480)

#close device

> dev.off()









