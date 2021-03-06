plot3 <- function(){
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
    power_house_cons$datetime<-as.POSIXct(paste(power_house_cons$Date,power_house_cons$Time), 
                                          format="%d/%m/%Y %H:%M:%S")
  power_house_cons$Sub_metering_1 <- as.numeric(power_house_cons$Sub_metering_1)
  power_house_cons$Sub_metering_2 <- as.numeric(power_house_cons$Sub_metering_2)
  power_house_cons$Sub_metering_3 <- as.numeric(power_house_cons$Sub_metering_3)
  win.graph(5,5)
  plot(power_house_cons$datetime,power_house_cons$Sub_metering_1,type="l")
  lines(power_house_cons$datetime,power_house_cons$Sub_metering_2,type = "l",col="red")
  lines(power_house_cons$datetime,power_house_cons$Sub_metering_3,type = "l",col="blue")
  legend("topright",pch=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
  dev.copy(png,file="plot3.png")
  dev.off()
}