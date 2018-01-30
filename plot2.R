data_power_consumption <- read.table(
    pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"Date\" || $1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"),
    header=TRUE,
    sep = ";")
data_power_consumption$Date <- as.Date(data_power_consumption$Date,
                                       format="%d/%m/%Y")

plot(as.POSIXct(paste(data_power_consumption$Date,
                      data_power_consumption$Time)),
      data_power_consumption$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power (kilowatts)"
)
dev.copy(png, file="plot2.png", width = 480, height = 480)
dev.off()