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

png(filename = "plot4.png", width = 480, height = 480, bg="transparent")

par(mfrow = c(2, 2))

with(work, plot( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                 Global_active_power,
				 type = "l",                 
	             ylab = "Global Active Power",
	             xlab = "",
	             main = "" ) )

with(work, plot( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                 Voltage,
				 type = "l",                 
	             ylab = "Voltage",
	             xlab = "datetime",
	             main = "" ) )
				 
with(work, plot( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                 Sub_metering_1,
				 type = "l",                 
	             ylab = "Energy sub metering",
	             xlab = "",
	             main = "" ) )	
				 
with(work, points( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                   Sub_metering_2,
				   col="red",
				   type = "l") )	

with(work, points( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                   Sub_metering_3,col="blue",
				   type = "l") )
				   
legend("topright", lty=1, col = c("black", "red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

with(work, plot( strptime( paste(as.character(work[,"Date"]),work[,"Time"]) , "%Y-%m-%d %H:%M:%S"), 
                 Global_reactive_power,
				 type = "l",                 
	             ylab = "Global_reactive_power",
	             xlab = "datetime",
	             main = "" ) )

dev.off()
