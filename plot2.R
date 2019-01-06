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

# Time series plot for "Global Active Power" 
plot2 <- plot(TwoDaysFebruary$DateTime, TwoDaysFebruary$Global_active_power, type = "l", 
               xlab = "", ylab = "Global Active Power (kilowatts)")

# Save plot2 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot2", width = 480, height = 480)
dev.off()