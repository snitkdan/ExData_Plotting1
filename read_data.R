library(dplyr)
library(lubridate)

#' A Zip Reading Function
#' 
#' This function allows you to read in 
#' a zip file from the web and 
#' unzip it within your current working 
#' directory. 
#' 
#' @param url (the url containing the .zip)
#' @param basename (name of the .zip file excluding the '.zip' part)
#' @export
#' @examples
#' read_zip("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", "household_power_consumption");
read_zip <- function(url, basename) {
  zipfile <- paste(basename, ".zip", sep = "")
  txtfile <- paste(basename, ".txt", sep = "")
  # 1. Download the zip
  if (!file.exists(zipfile)) {
    download.file(url = url, destfile = zipfile, method = "auto")
  }
  # 2. Unpack the files
  if (!file.exists(txtfile)) {
    unzip(zipfile)
  }
}

#' A Txt Reading Function
#' 
#' This function allows you to read in 
#' a txt file from a local text file in 
#' your current working directory, and 
#' return a basic tbl_df from that data. 
#' 
#' @param basename (name of the txt file excluding the 'txt' part)
#' @param separator (delimiter between data fields)
#' @export
#' @examples
#' read_txt("example.txt", ";");
read_txt <- function(basename, separator) {
  txtfile <- paste(basename, ".txt", sep = "")
  data <- tbl_df(read.table(txtfile, header = TRUE, sep = separator, stringsAsFactors = FALSE))
  return(data)
}

#' A Data Cleaning Function
#' 
#' This function returns 
#' a cleaned version 
#' of the household_power_consumption
#' dataset by the columns to the appropriate
#' data types and filtering
#' to only include Dates between 2007-02-1 and 2007-02-02 
#' 
#' @param data (raw household_power_consumption dataset)
#' @export
#' @examples
#' clean(data)
clean <- function(data) {
  clean_data <- data %>% 
    mutate(Datetime = dmy_hms(paste(Date, Time))) %>% 
    mutate(Date = dmy(Date)) %>% 
    filter(Date >= ymd("2007-02-01") & Date <= ymd("2007-02-02")) %>% 
    mutate(Global_active_power = as.numeric(Global_active_power)) %>% 
    mutate(Global_reactive_power = as.numeric(Global_reactive_power)) %>% 
    mutate(Voltage = as.numeric(Voltage)) %>% 
    mutate(Global_intensity = as.numeric(Global_intensity)) %>% 
    mutate(Sub_metering_1 = as.numeric(Sub_metering_1)) %>% 
    mutate(Sub_metering_2 = as.numeric(Sub_metering_2)) %>% 
    mutate(Sub_metering_3 = as.numeric(Sub_metering_3))
  return(clean_data)
}

