library(dplyr)
library(lubridate)


colClasses = c(c("character", "character"),replicate(7,"numeric"))
data <- read.csv("household_power_consumption.txt", na.strings = "?",sep = ";", colClasses = colClasses)

data_tbl <- data %>%
  tbl_df %>%
  mutate(datetime = dmy(Date) + hms(Time)) %>%
  filter(datetime >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))

png(filename = "plot2.png", width = 480, height = 480)

plot(data_tbl$datetime, data_tbl$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

dev.off()