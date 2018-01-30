# EXAMPLE 0
# require(sqldf)
# read.csv.sql
# data_power_consumption <- read.table("household_power_consumption.txt", 
#                                      header = T,
#                                      sep = ";")
#
# EXAMPLE 1
# DF <- data.frame(n=1:26, l=LETTERS)
# write.table(DF, file="data.txt", row.names=FALSE, sep=";")
# read.table(pipe("awk 'BEGIN {FS=\";\"} {if ($1 > 20) print $0}' data.txt"), header=TRUE, sep=";")
# 
# EXAMPLE 2
# dd <- seq(as.Date("1980-01-01"), as.Date("1980-01-31"), by = "day")
# DF <- data.frame(Date = dd, Value = seq_along(dd))
# write.table(DF, file = "test2.txt", row.names = FALSE, sep=";")
# read.table(pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"1980-01-10\" || $1 == \"1980-01-20\") print $0}' test2.txt"), header=FALSE, sep=";")

data_power_consumption <- read.table(
    pipe("awk 'BEGIN {FS=\";\"} {if ($1 == \"Date\" || $1 == \"1/2/2007\" || $1 == \"2/2/2007\") print $0}' household_power_consumption.txt"),
    header=TRUE,
    sep = ";")
data_power_consumption$Date <- as.Date(data_power_consumption$Date,
                                       format="%d/%m/%Y")

hist(data_power_consumption$Global_active_power,
     breaks = 12,
     col = "red",
     main = "Global Active Power",
     # xlim = seq(0.5, 6, 0.5),
     xlab = "Global Active Power (kilowatts)",
     ylab = "Frequency")
dev.copy(png, file="plot1.png", width = 480, height = 480)
dev.off()