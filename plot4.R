## Project 1, Coursera Exploratory Data Analysis
## plot4.R
library(dplyr)
library(lubridate)

# check whether data frame "hpcdf" already exists
#        and, if not, create it
if(!exists("hpcdf")){
        hpc <- read.table("household_power_consumption.txt", header=TRUE, sep = ";"
                          , na.strings = "?", stringsAsFactors = FALSE)
        
        hpc$Date <- strptime(hpc$Date, format = "%d/%m/%Y")
        hpc$DateTime <- strptime(paste(hpc$Date,hpc$Time), format = "%Y-%m-%d %H:%M:%S")
        
        hpcdf <- subset(hpc,Date >= mdy("2/1/2007") & Date < mdy("2/3/2007"))
}


## Plot 4
# set margins, arrange as two columns each containing two rows of charts
par(mar = c(4,4,4,1), mfcol = c(2,2))

# col 1 row 1 is essentially Plot 2, w ylab modified
with(hpcdf, plot(DateTime
                 ,Global_active_power
                 ,xlab = ""
                 ,ylab = "Global Active Power"
                 ,pch = "."))
with(hpcdf, lines(DateTime,Global_active_power))

# col 1 row 2 is essentially Plot 3, w legend modified
with(hpcdf, {
        plot(c(DateTime, DateTime, DateTime)
             ,c(Sub_metering_1, Sub_metering_2, Sub_metering_3)
             ,xlab = ""
             ,ylab = "Energy sub metering"
             ,type = "n")
        lines(DateTime
              ,Sub_metering_1
              ,col = "black")
        lines(DateTime
              ,Sub_metering_2
              ,col = "red")
        lines(DateTime
              ,Sub_metering_3
              ,col = "blue")
})

legend("topright"
       ,legend = c("Sub_metering_1"
                   , "Sub_metering_2"
                   , "Sub_metering_3")
       ,col = c("black"
                ,"red"
                ,"blue")
       ,lty = 1
       ,bty = "n"
       ,cex = 0.8)


# col 2 row 1
with(hpcdf, plot(DateTime
                 ,Voltage
                 ,xlab = "datetime"
                 ,ylab = "Voltage"
                 ,pch = "."))
with(hpcdf, lines(DateTime,Voltage))



# col 2 row 2
with(hpcdf, plot(DateTime
                 ,Global_reactive_power
                 ,xlab = "datetime"
                 ,pch = "."))
with(hpcdf, lines(DateTime,Global_reactive_power))

mtext(expression(bold("Plot 4")),side=3,outer=T,adj=0,line=-1.25, cex=1.25)







