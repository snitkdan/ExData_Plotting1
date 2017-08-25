# 0. Imports
source("read_data.R")
# 1. Read in the data
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
basename <- "household_power_consumption"
read_zip(url, basename) # see read_data.R
data <- read_txt(basename, ";") # see read_data.R
# 2. Clean the data
clean_data <- clean(data) # see read_data.R
# 3. Generate plot2
png(file="plot2.png", width=480, height=480)
with(clean_data, plot(Datetime, Global_active_power, type = "l", xlab = "", ylab="Global Active Power (kilowatts)"))
dev.off()

