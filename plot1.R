Sys.setlocale("LC_TIME", "English")

ccls <- c("character","character","character","character","character","character","character","character","character")
data <- read.csv("household_power_consumption.txt",sep=";",colClasses=ccls)
data[,"Date"] <- as.Date(data[,"Date"],format="%d/%m/%Y")
work <- subset( data, Date=="2007-02-01" | Date=="2007-02-02" )
work[,"Global_active_power"] <- as.numeric(work[,"Global_active_power"])
work[,"Global_reactive_power"] <- as.numeric(work[,"Global_reactive_power"])
work[,"Voltage"] <- as.numeric(work[,"Voltage"])
work[,"Global_intensity"] <- as.numeric(work[,"Global_intensity"])
work[,"Sub_metering_1"] <- as.numeric(work[,"Sub_metering_1"])
work[,"Sub_metering_2"] <- as.numeric(work[,"Sub_metering_2"])
work[,"Sub_metering_3"] <- as.numeric(work[,"Sub_metering_3"])

png(filename = "plot1.png", width = 480, height = 480, bg="transparent")
with(work, hist( Global_active_power,
                 col  = "red",
	             xlab = "Global Active Power (kilowwatts)",
	             ylab = "Frequency",
	             main = "Global Active Power" ) )	  
dev.off()


