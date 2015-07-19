#save data file in your working directory
readtxtfile <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, dec=".")

#filter dataset to contain dates between '01/02/2007' and '02/02/2007'
selfebfile <- readtxtfile[readtxtfile[,1] %in% c("1/2/2007","2/2/2007"),]

#create a vector of Date & Time in the format of day of the week.
ydt <- strptime(paste(as.character(selfebfile[,1]),as.character(selfebfile[,2]),sep=" "),"%d/%m/%Y %H:%M:%S")
#weekdays(as.Date(ydt,"%d/%m/%Y"),abbreviate=TRUE)

#create a vectors for 'Energy sub metering' in the format of numeric.
sm1 <- as.numeric(as.character(selfebfile[,7]))  # For sub-metering-1
sm2 <- as.numeric(as.character(selfebfile[,8]))  # For sub-metering-2
sm3 <- as.numeric(as.character(selfebfile[,9]))  # For sub-metering-9

z <- data.frame(ydt,sm1,sm2,sm3)


#plot graph "Day"(datetime) Versus "Energy submetering" (sub-metering-1, sub-metering-2, sub-metering-3) 
plot(z[,1],z[,2], type="l", ylab="Energy sub metering", xlab=" ")
lines(z[,1],z[,3], type="l", col="red")
lines(z[,1],z[,4], type="l", col="blue")
legend("topright",c("sub_metering_1","submetering_2","sub_metering_3"),lty=1,lwd=2.5, col=c("black","red","blue"))

##plot copied in .png file in current working directory
dev.copy(png,file="plot3.png",width=480,height=480)
dev.off()