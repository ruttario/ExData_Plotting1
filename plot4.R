data_power_consumption <- read.table(
    pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"Date\" || $1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"),
    header=TRUE,
    sep = ";")
data_power_consumption$Date <- as.Date(data_power_consumption$Date,
                                       format="%d/%m/%Y")

# to maintain aspect ratio
quartz(width=7, height=7, bg="white")

# to create a 2x2 layout, filled by row
par(mfrow=c(2,2))

# graph 1, 1
plot(as.POSIXct(paste(data_power_consumption$Date,
                      data_power_consumption$Time)),
     data_power_consumption$Global_active_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Active Power"
)

# graph 1, 2
plot(as.POSIXct(paste(data_power_consumption$Date,
                      data_power_consumption$Time)),
     data_power_consumption$Voltage,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Voltage"
)

# graph 2, 1
plot(as.POSIXct(paste(data_power_consumption$Date,
                      data_power_consumption$Time)),
     data_power_consumption$Sub_metering_1,
     type = "l",
     col = "black",
     main = "",
     xlab = "",
     ylab = "Energy sub metering"
)
lines(as.POSIXct(paste(data_power_consumption$Date,
                       data_power_consumption$Time)),
      data_power_consumption$Sub_metering_2,
      col = "red"
)
lines(as.POSIXct(paste(data_power_consumption$Date,
                       data_power_consumption$Time)),
      data_power_consumption$Sub_metering_3,
      col = "blue"
)
legend("topright",
       legend = c(names(data_power_consumption)[7:9]),
       col = c("black", "red", "blue"),
       lwd = 1,
       cex = 0.5
)

# graph 2, 2
plot(as.POSIXct(paste(data_power_consumption$Date,
                      data_power_consumption$Time)),
     data_power_consumption$Global_reactive_power,
     type = "l",
     main = "",
     xlab = "",
     ylab = "Global Reactive Power"
)

# copy plot to device PNG saving the plot as a PNG picture
dev.copy(png, file="plot4.png", width = 480, height = 480)
dev.off()