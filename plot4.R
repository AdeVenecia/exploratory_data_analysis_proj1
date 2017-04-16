#working directory contains household_power_consumption.txt
proj_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#capture data from the dates 2007-02-01 and 2007-02-02
proj_subData <- proj_data[proj_data$Date %in% c("1/2/2007","2/2/2007"),]

#convert Data and Time variables to Date/Time classes
date_time <- strptime(paste(proj_subData$Date, proj_subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#capture data needed for plot 3 : Global_active_power, Global_reactive_power, 
#Voltage, Sub_metering_1, Sub_metering_2 and Sub_metering_3
plot4_Gap <- as.numeric(proj_subData$Global_active_power)
plot4_sM1 <- as.numeric(proj_subData$Sub_metering_1)
plot4_sM2 <- as.numeric(proj_subData$Sub_metering_2)
plot4_sM3 <- as.numeric(proj_subData$Sub_metering_3)
plot4_Grp <- as.numeric(proj_subData$Global_reactive_power)
plot4_Vol <- as.numeric(proj_subData$Voltage)

#open PNG Graphic device for output, width and height at 480px
png("plot4.png", width=480, height=480)

#set plotting dimensions 2 rows, 2 columns
par(mfrow = c(2,2))

#plot Global_active_power
plot(date_time, plot4_Gap, type="l", xlab="", ylab="Global Active Power", cex=0.2)

#plot Voltage
plot(date_time, plot4_Vol, type="l", xlab="datetime", ylab="Voltage")

#plot Sub_metering_1 to 3 with the legends
plot(date_time, plot4_sM1, type="l", xlab = "", ylab="Energy Submetering")
lines(date_time, plot4_sM2, type="l", col="red")
lines(date_time, plot4_sM3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty = "0")
#plot Global_reactive_power
plot(date_time, plot4_Grp, type="l", xlab="datetime", ylab="Global_reactive_power")

#close graphic device
dev.off()