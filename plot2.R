setwd("Coursera/Exploratory_Data_Analysis/")
#first of all I extract the first 3 lines of the file in order to understand which field separator has been used and what kind of variables are present in the dataset
initial <- read.table("household_power_consumption.txt", nrows=3, header=T)
initial
#Date.Time.Global_active_power.Global_reactive_power.Voltage.Global_intensity.Sub_metering_1.Sub_metering_2.Sub_metering_3
#1                                                         16/12/2006;17:24:00;4.216;0.418;234.840;18.400;0.000;1.000;17.000
#2                                                         16/12/2006;17:25:00;5.360;0.436;233.630;23.000;0.000;1.000;16.000
#3                                                         16/12/2006;17:26:00;5.374;0.498;233.290;23.000;0.000;2.000;17.000
#now I import the entire dataset setting the sep argument equal to ";". I aslo set header=T
data <- read.table("household_power_consumption.txt", header=T, sep=";",stringsAsFactors=F)
#I subset the data frame for the requested dates
sub.data <-data[data$Date=="1/2/2007" | data$Date=="2/2/2007",  ]
sub.data$DateTime <- as.POSIXct(paste(sub.data$Date,sub.data$Time), format="%d/%m/%Y %H:%M:%S")
sub.data <- transform(sub.data,Global_active_power=as.numeric(Global_active_power))
plot(Global_active_power ~ DateTime, data=sub.data,type="l", ylab="Global Active Power (killowatts)", xlab= "")
dev.copy(png, file = "plot2.png") 
dev.off()



