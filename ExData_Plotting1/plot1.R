plot1 <- function(){
/* reading all the values from table */
house_pwr <- read.table(fileUrl,sep = ";")
house_pwr <- house_pwr[2,2075260]
/* splitting the data frame by dates*/
s <- split(house_pwr,house_pwr$V1)
/* taking the dates which are required*/
x1 <- as.data.frame(s["1/2/2007"])
x2 <- as.data.frame(s["2/2/2007"])
/* Changing the colnames for both frames so that we have same column names*/
colnames(x1) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")
colnames(x2) <- c("Date","Time","Global_active_power","Global_reactive_power",
                  "Voltage","Global_intensity","Sub_metering_1","Sub_metering_2",
                  "Sub_metering_3")
/* binding both values into one*/
power_house_cons <- rbind(x1,x2)
/* converting the date and time values from character to respective types*/
power_house_cons$Date <- as.Date(as.character(power_house_cons$Date),"%d/%m/%Y")
power_house_cons$Time <- strptime(as.character(power_house_cons$Time),"%H:%M:%S")
power_house_cons$Global_active_power <- as.numeric(as.character
                                      (power_house_cons$Global_active_power))
win.graph(5,5)
hist(power_house_cons$Global_active_power,col="red")
dev.copy(png,file="plot1.png")
dev.off()
}