library(dplyr)
library(lubridate)


colClasses = c(c("character", "character"),replicate(7,"numeric"))
data <- read.csv("household_power_consumption.txt", na.strings = "?",sep = ";", colClasses = colClasses)

data_tbl <- data %>%
  tbl_df %>%
  mutate(datetime = dmy(Date) + hms(Time)) %>%
  filter(datetime >= ymd("2007-02-01") & datetime < ymd("2007-02-03"))

png(filename = "plot4.png", width = 480, height = 480)

#Setup 2x2 plots
par(mfcol = c(2,2))

#Upper left plot

plot(data_tbl$datetime, data_tbl$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

#Lower Left Plot

plot(data_tbl$datetime, data_tbl$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")

lines(data_tbl$datetime, data_tbl$Sub_metering_2,
      col = "red")

lines(data_tbl$datetime, data_tbl$Sub_metering_3,
      col = "blue")

legend("topright",
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), 
       lty = c(1,1,1),
       bty = "n")

#Upper Right Plot

plot(data_tbl$datetime, data_tbl$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

#Lower Right plot

plot(data_tbl$datetime, data_tbl$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")



dev.off()