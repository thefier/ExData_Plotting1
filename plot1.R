plot1<-function(){
        tb01<-read.table("household_power_consumption.txt",sep=";",colClasses="character", header=T)
        tb01$final.time<-paste(tb01[,1],tb01[,2],sep=" ")
        tb01$final.time<-strptime(tb01$final.time,"%d/%m/%Y %H:%M:%S")
        tb01$dayweek<-weekdays(tb01$final.time)
        minD<-"2007/31/01"
        maxD<-"2007/03/02"
        minD<-as.Date(minD,"%Y/%d/%m")
        maxD<-as.Date(maxD,"%Y/%d/%m")
        tb01[,1]<-as.Date(tb01[,1],"%d/%m/%Y")
        helpel<-as.POSIXlt(tb01[,1])> as.POSIXlt(minD) & as.POSIXlt(tb01[,1])<as.POSIXlt(maxD)
        tb001<-tb01[helpel,]
        tb001[,3]<-as.numeric(tb001[,3])
        png(file="plot1.png")
        par(bg = 'transparent')
        hist(tb001[,3],xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power",col="red")
        dev.off()
}