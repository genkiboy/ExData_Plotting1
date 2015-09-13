## Project 1, Coursera Exploratory Data Analysis
## plot1.R
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


## Plot 1
# set margins, arrange as one chart (i.e., 1 col X 1 row)
par(mar = c(4,4,8,1), mfrow=c(1,1))

with(hpcdf,hist(Global_active_power
                , col = "red"
                , main = "Global Active Power"
                , xlab = "Global Active Power (kilowatts)"))

mtext(expression(bold("Plot 1")),side=3,outer=T,adj=0,line=-1.25, cex=1.25)
