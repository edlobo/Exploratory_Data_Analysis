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


# Getting Plot4

        library(lubridate)
        png("Plot4.png", width = 480, height = 480)
        par(mfrow=c(2,2))
        fecha <- dmy(DataIn$Date)
        DataIn$Period <- NULL
        # Formatting data into a valid class and creating a new columm in the data frame
        DataIn$Period<- ymd_hms(paste(fecha, DataIn$Time, sep = " "))
    
        # First plot
        with(DataIn, plot(Period,Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="") )

        # Second Plot
        with(DataIn, plot(Period,Voltage, type="l", ylab="Voltage", xlab="datetime") )

        # Third Plot
        with(DataIn, plot(Period, Sub_metering_1, ylab ="Energy Sub Metering", xlab ="", type = "l"))
        with(DataIn, lines(Period, Sub_metering_2, type = "l", col="red"))
        with(DataIn, lines(Period, Sub_metering_3, type = "l", col="blue"))
        legend("topright", lty=1, legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), col = c("black", "red", "blue"), bty = "n", cex = 0.5, xjust=1, y.intersp = 0.4)

        # Four Plot
        with(DataIn, plot(Period,Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime") )
        dev.off()
        