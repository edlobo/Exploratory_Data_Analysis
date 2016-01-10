#################################################################
# This code is intended to fulfill with the First assignment of #
# course Exploratory Data Analysis of Coursera                  #
#################################################################

# Reading the input file
        filtro <- grep("^[1,2]/2/2007", read_lines("household_power_consumption.txt"))
        DataIn <- read.table("household_power_consumption.txt", header = FALSE, na.strings = "?", sep = ";", skip = filtro[1] -1, nrows = length(filtro))
        File_Header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        colnames(DataIn) <- names(File_Header)

# Getting Plot1
        png("Plot1.png", width = 480, height = 480)
        hist(DataIn$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
        dev.off()
