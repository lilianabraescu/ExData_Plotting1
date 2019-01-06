setwd("/Users/lilianabraescu/_DataScience-JHU/Course4_Exploratory_Data_Analysis/Week1")
if(!file.exists('exdata_data_household_power_consumption.txt')){
        unzip(zipfile = 'exdata_data_household_power_consumption.zip')}

full_data <- read.csv("household_power_consumption.txt", header = TRUE, sep = ';',
                      na.strings = "?", stringsAsFactors = FALSE, 
                      comment.char = "", quote = '\"')
str(full_data)
        TwoDaysFebruary <- subset(full_data , Date %in% c("1/2/2007","2/2/2007"))
        TwoDaysFebruary$Date <- as.Date(TwoDaysFebruary$Date, format = "%d/%m/%Y")
        TwoDaysFebruary <- data.frame(TwoDaysFebruary)
      
# Plot histogram for "Global Active Power"
plot1 <- hist(TwoDaysFebruary$Global_active_power, main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", ylab = "Frequency", col = "Red")

# Save plot1 to a PNG file with a width of 480 pixels and a height of 480 pixels
dev.copy(png, file = "plot1", width = 480, height = 480)
dev.off()