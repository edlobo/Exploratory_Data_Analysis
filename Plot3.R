#################################################################
# This code is intended to fulfill with the First assignment of #
# course Exploratory Data Analysis of Coursera                  #
# To follow this code put the input file in your home directory #
#################################################################

# Reading the input file into a Data Frame
        filtro <- grep("^[1,2]/2/2007", read_lines("household_power_consumption.txt"))
        DataIn <- read.table("household_power_consumption.txt", header = FALSE, na.strings = "?", sep = ";", skip = filtro[1] -1, nrows = length(filtro))
        File_Header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        colnames(DataIn) <- names(File_Header)

# Getting Plot3

        library(lubridate)

        par(mfrow=c(1,1)) 
        png("Plot3.png", width = 480, height = 480)
        with(DataIn, plot(Period, Sub_metering_1, ylab ="Energy Sub Metering", xlab ="", type = "l"))
        with(DataIn, lines(Period, Sub_metering_2, type = "l", col="red"))
        with(DataIn, lines(Period, Sub_metering_3, type = "l", col="blue"))
        legend("topright", lty=c(1,1), legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),  col = c("black","red", "blue"), cex = 0.6)
        dev.off()
