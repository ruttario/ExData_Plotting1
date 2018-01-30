data_power_consumption <- read.table(
    pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"Date\" || $1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"),
    header=TRUE,
    sep = ";")
data_power_consumption$Date <- as.Date(data_power_consumption$Date,
                                       format="%d/%m/%Y")

# to maintain aspect ratio
quartz(width=7, height=7, bg="white")

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

# copy plot to device PNG saving the plot as a PNG picture
dev.copy(png, file="plot3.png", width = 480, height = 480)
dev.off()