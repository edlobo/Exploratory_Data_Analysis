#################################################################
# This code is intended to fulfill with the First assignment of #
# course Exploratory Data Analysis of Coursera                  #
#################################################################

# Reading the input file into a Data Frame
        filtro <- grep("^[1,2]/2/2007", read_lines("household_power_consumption.txt"))
        DataIn <- read.table("household_power_consumption.txt", header = FALSE, na.strings = "?", sep = ";", skip = filtro[1] -1, nrows = length(filtro))
        File_Header <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 1)
        colnames(DataIn) <- names(File_Header)

# Getting Plot2

        library(lubridate)
        
        par(mfrow=c(1,1)) 
        fecha <- dmy(DataIn$Date)
        DataIn$Period <- NULL
        # Formatting data into a valid class and creating a new columm in the data frame
        DataIn$Period<- ymd_hms(paste(fecha, DataIn$Time, sep = " "))
        png("Plot2.png", width = 480, height = 480)
        with(DataIn, plot(Period,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") )
        dev.off()
