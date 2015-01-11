library(dplyr)
library(lubridate)


colClasses = c(c("character", "character"),replicate(7,"numeric"))
data <- read.csv("household_power_consumption.txt", na.strings = "?",sep = ";", colClasses = colClasses)

data_tbl <- data %>%
  tbl_df %>%
  mutate(datetime = dmy(Date) + hms(Time)) %>%
  filter(datetime >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))

png(filename = "plot1.png", width = 480, height = 480)

hist(data_tbl$Global_active_power,
     col='red',
     main = "Global Active Power",
     ylab = "Frequency", 
     xlab = "Global Active Power (kilowatts)")

dev.off()