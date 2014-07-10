plot2 <- function() {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, method="curl")
    power <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", na.strings=c("?"), header=T)
    power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
    unlink(temp)

    png("plot2.png")
    dateTimes <- strptime(paste(power$Date, power$Time), "%d/%m/%Y %H:%M:%S")
    plot(dateTimes, power$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l")
    dev.off()
}
