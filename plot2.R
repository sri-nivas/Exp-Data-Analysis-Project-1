###-------------- READ FILE ---------------
#save data file in your working directory
readtxtfile <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, dec=".")

#filter dataset to contain dates between '01/02/2007' and '02/02/2007'
selfebfile <- readtxtfile[readtxtfile[,1] %in% c("1/2/2007","2/2/2007"),]

### ------------- BUILD SUBSET-----------
#create a vector of 'Global Active Power' in the format of decimals.
gap <- as.numeric(as.character(selfebfile[,3]))

#create a vector of Date & Time in the format of day of the week.
ydt <- strptime(paste(as.character(selfebfile[,1]),as.character(selfebfile[,2]),sep=" "),"%d/%m/%Y %H:%M:%S")
#weekdays(as.Date(ydt,"%d/%m/%Y"),abbreviate=TRUE)


z <- data.frame(ydt,gap)

### ------------- BUILD PLOT-----------
#plot graph "Day"(datetime) Versus "Global Active Power" 
plot(z[,1],z[,2], type="l",ylab="Global Active Power (kilowatts)",xlab=" ")

###-------------- SAVE PLOT -------------
##plot copied in .png file in current working directory
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()