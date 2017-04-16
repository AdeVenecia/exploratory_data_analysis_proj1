#working directory contains household_power_consumption.txt
proj_data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#capture data from the dates 2007-02-01 and 2007-02-02
proj_subData <- proj_data[proj_data$Date %in% c("1/2/2007","2/2/2007"),]

#capture data needed for plot 1: Global_active_power
plot1_Gap <- as.numeric(proj_subData$Global_active_power)

#open PNG Graphic device for output, width and height at 480px
png("plot1.png", width=480, height=480)

#plot the data using hist with the specified parameters
hist(plot1_Gap, main = "Global Active Power", col="red", xlab="Global Active Power (kilowatts)")

#close graphic device
dev.off()