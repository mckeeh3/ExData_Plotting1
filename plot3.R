plot3 <- function() {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, method="curl")
    power <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", na.strings=c("?"), header=T)
    power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
    unlink(temp)

    png("plot3.png")
    colors <- c("black","red","blue")
    dateTimes <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
    plot(dateTimes, power$Sub_metering_1, col=colors[1], ylab="Energy sub metering", xlab="", type="l")
    lines(dateTimes, power$Sub_metering_2, col=colors[2])
    lines(dateTimes, power$Sub_metering_3, col=colors[3])
    legend("topright", names(power)[7:9], col=colors, lty=1)
    dev.off()
}
