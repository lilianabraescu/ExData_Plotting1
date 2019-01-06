setwd("/Users/lilianabraescu/_DataScience-JHU/Course4_Exploratory_Data_Analysis/Week1")
if(!file.exists('exdata_data_household_power_consumption.txt')){
        unzip(zipfile = 'exdata_data_household_power_consumption.zip')}

full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';',
                      na.strings = "?", stringsAsFactors = FALSE, 
                      comment.char = "", quote = '\"')
str(full_data)
        TwoDaysFebruary <- subset(full_data , Date %in% c("1/2/2007","2/2/2007"))
        TwoDaysFebruary$Date <- as.Date(TwoDaysFebruary$Date, format = "%d/%m/%Y")

        DateTime <- paste(as.Date(TwoDaysFebruary$Date), TwoDaysFebruary$Time)
        TwoDaysFebruary$DateTime <- as.POSIXct(DateTime)
        
# Panel of the four time series plot 
plot4 <- par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
        with(TwoDaysFebruary, {
                plot(Global_active_power ~ DateTime, type = "l", 
                     xlab="", ylab="Global Active Power")
                plot(Voltage ~ DateTime, type = "l", 
                     xlab="datetime", ylab="Voltage")
                plot(Sub_metering_1 ~ DateTime, type = "l",
                     xlab = "", ylab = "Energy Sub Metering")
                  lines(Sub_metering_2 ~ DateTime, col = "red")
                  lines(Sub_metering_3 ~ DateTime, col = "blue")
                  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
                  cex = 0.8, y.intersp = 0.4, bty="n", inset = c(-0.05, -0.05),
                  legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
                plot(Global_reactive_power ~ DateTime, type="l", 
                     xlab="datetime", ylab="Global Rective Power")
        })
        
# Save plot4 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot4", width = 480, height = 480)
dev.off()