# 0. Imports
source("read_data.R")
# 1. Read in the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
basename <- "household_power_consumption"
read_zip(url, basename) # see read_data.R
data <- read_txt(basename, ";") # see read_data.R
# 2. Clean the data
clean_data <- clean(data) # see read_data.R
# 3. Generate plot3
png(file="plot3.png", width=480, height=480)
with(clean_data, plot(Datetime, Sub_metering_1, type = "n", xlab = "", ylab="Energy sub metering"))
with(clean_data, lines(Datetime, Sub_metering_1, type = "l", col = "black"), lwd = 1)
with(clean_data, lines(Datetime, Sub_metering_2, type = "l", col = "red"), lwd = 1)
with(clean_data, lines(Datetime, Sub_metering_3, type = "l", col = "blue", lwd = 1))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1,1), lwd = c(1,1), col = c("black", "red", "blue"))
dev.off()

