setwd("D:/Course on DS - coursera/Lecture4 - Exploratory Data Analysis/Week1/Assignment")

#Read the data:
df<-read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";",stringsAsFactors = FALSE)
head(df)

#Convert the Date variable to the Date class:
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df$DateTime<-strptime(paste(df$Date,df$Time),format="%Y-%m-%d %H:%M:%S")

#Subsetting the data to [2007-02-01, 2007-02-02]:
dfSubset<-subset(df,Date<="2007-02-02" & Date>="2007-02-01")

png("plot3.png",width=480,height=480)
with(dfSubset,{plot(DateTime,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering")
    lines(Sub_metering_2 ~ as.POSIXct(DateTime),col="red")
    lines(Sub_metering_3 ~ as.POSIXct(DateTime),col="blue")
    legend("topright",lty=1,col=c("black","red","blue"),legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))})
dev.off()
