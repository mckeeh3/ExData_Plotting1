plot1 <- function() {
    temp <- tempfile()
    download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", temp, method="curl")
    power <- read.table(unz(temp, "household_power_consumption.txt"), sep=";", na.strings=c("?"), header=T)
    power <- subset(power, Date == "1/2/2007" | Date == "2/2/2007")
    unlink(temp)

    png("plot1.png")
    hist(power$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power")
    dev.off()
}
