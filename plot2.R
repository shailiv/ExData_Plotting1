library(dplyr)
library(lubridate)

df<-read.table('household_power_consumption.txt',header = TRUE, sep = ';')
df$Date <-as.Date(df$Date,format = "%d/%m/%Y")
df<-df[df$Date >= "2007-2-1" & df$Date <= "2007-2-2",]
df$DateTime <- strptime(paste(df$Date,df$Time), 
                        format = "%Y-%m-%d %H:%M:%S")
png('plot2.png', height = 480 , width = 480  )
with(df, plot(DateTime, Global_active_power, type = "l", xlab = "",
                       ylab = "Global Active Power (kilowatts)", xaxt = "n"))
axis(side = 1, at = c(as.numeric(df$DateTime[1]),
                      as.numeric(df$DateTime[1441]),
                      as.numeric(df$DateTime[2880])),labels = c("Thu","Fri","Sat"))
dev.off()
