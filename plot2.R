#working directory contains household_power_consumption.txt
proj_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#capture data from the dates 2007-02-01 and 2007-02-02
proj_subData <- proj_data[proj_data$Date %in% c("1/2/2007","2/2/2007"),]

#convert Data and Time variables to Date/Time classes
date_time <- strptime(paste(proj_subData$Date, proj_subData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#capture data needed for plot 2 : Global_active_power
plot2_Gap <- as.numeric(proj_subData$Global_active_power)

#open PNG Graphic device for output, width and height at 480px
png("plot2.png", width=480, height=480)

#plot the data using plot with the specified parameters
plot(date_time, plot2_Gap, xlab="", ylab="Global Active Power (kilowatts)", type="l")

#close graphic device
dev.off()