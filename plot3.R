#working directory contains household_power_consumption.txt
proj_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#capture data from the dates 2007-02-01 and 2007-02-02
proj_subData <- proj_data[proj_data$Date %in% c("1/2/2007","2/2/2007"),]

#convert Data and Time variables to Date/Time classes
date_time <- strptime(paste(proj_subData$Date, proj_subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#capture data needed for plot 3 : Sub_metering_1, Sub_metering_2 and Sub_metering_3
plot3_sM1 <- as.numeric(proj_subData$Sub_metering_1)
plot3_sM2 <- as.numeric(proj_subData$Sub_metering_2)
plot3_sM3 <- as.numeric(proj_subData$Sub_metering_3)

#open PNG Graphic device for output, width and height at 480px
png("plot3.png", width=480, height=480)

#plot sub_metering_1 data using plot with the specified parameters
plot(date_time, plot3_sM1, type="l", xlab = "", ylab="Energy Submetering")

#add sub_metering_2 and sub_metering_3 to the plot
lines(date_time, plot3_sM2, type="l", col="red")
lines(date_time, plot3_sM3, type="l", col="blue")

#add the necessary legends
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

#close graphic device
dev.off()