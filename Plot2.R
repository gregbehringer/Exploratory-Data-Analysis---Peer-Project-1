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

#build plot with specified labels

> plot(strptime(subsetPowerConsumption$DateTimeConsol, "%d/%m/%Y %H:%M:%S"), subsetPowerConsumption$Global_active_power, type = "l", xlab = "", ylab = "GlobalActivePower(kilowatts)")

#confirm working directory for png write

> getwd()
[1] "C:/Users/ghb206/Documents"

#open device and write png to wd 

> dev.copy(png, file="Plot2.png", height=480, width=480)

#close device

> dev.off()