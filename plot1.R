###-------------- READ FILE ---------------
#save data file in your working directory
readtxtfile <- read.table("./household_power_consumption.txt", sep=';', header=TRUE, dec=".")

#filter dataset to contain dates between '01/02/2007' and '02/02/2007'
selfebfile <- readtxtfile[readtxtfile[,1] %in% c("1/2/2007","2/2/2007"),]

### ------------- BUILD SUBSET-----------
#create a vector of 'Global Active Power' in the format of decimals.
gap <- as.numeric(as.character(selfebfile[,3]))

### ------------- BUILD PLOT-----------
#plot histogram for Global Active Power
hist(gap,col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

###-------------- SAVE PLOT -------------
#plot copied in .png file in current working directory
dev.copy(png,file="plot1.png",width=480,height=480)
dev.off()