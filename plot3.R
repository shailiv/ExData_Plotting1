library(dplyr)
library(lubridate)

df<-read.table('household_power_consumption.txt',header = TRUE, sep = ';')
df$Date <-as.Date(df$Date,format = "%d/%m/%Y")
df<-df[df$Date >= "2007-2-1" & df$Date <= "2007-2-2",]
df$DateTime <- strptime(paste(df$Date,df$Time), 
                        format = "%Y-%m-%d %H:%M:%S")


png('plot3.png', height = 480 , width = 480  )


with(df, plot(DateTime, Sub_metering_1, type = "n", xaxt = "n",
                       xlab = "", ylab = "Energy sub metering"))
axis(side = 1, at = c(as.numeric(df$DateTime[1]),
                      as.numeric(df$DateTime[1441]),
                      as.numeric(df$DateTime[2880])),labels = c("Thu","Fri","Sat"))
with(df, lines(DateTime, Sub_metering_1))
with(df, lines(DateTime, Sub_metering_2, col = "red"))
with(df, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright",lty = 1, col=c("black","red","blue"),
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()
