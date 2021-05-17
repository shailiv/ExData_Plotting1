library(dplyr)
df<-read.table('household_power_consumption.txt',header = TRUE, sep = ';')
df<-df[df$Date == "1/2/2007" | df$Date == "2/2/2007",]
png('plot1.png', height = 480 , width = 480  )
hist(as.numeric(df$Global_active_power), col = 'red', 
     xlab = 'Global Active Power (Kilowats)', main = 'Global Active Power')
dev.off()
