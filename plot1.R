setwd("D:/Course on DS - coursera/Lecture4 - Exploratory Data Analysis/Week1/Assignment")

#Read the data:
df<-read.table("household_power_consumption.txt",na.strings = "?",header=TRUE,sep=";",stringsAsFactors = FALSE)
head(df)

#Convert the Date variable to the Date class:
df$Date<-as.Date(df$Date,"%d/%m/%Y")
df$DateTime<-strptime(paste(df$Date,df$Time),format="%Y-%m-%d %H:%M:%S")

#Subsetting the data to [2007-02-01, 2007-02-02]:
dfSubset<-subset(df,Date<="2007-02-02" & Date>="2007-02-01")

png("plot1.png",width=480,height=480)
with(dfSubset,hist(Global_active_power,freq=TRUE,col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)"))
dev.off()
