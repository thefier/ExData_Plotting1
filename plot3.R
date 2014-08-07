plot3<-function(){
        tb01<-read.table("household_power_consumption.txt",sep=";",colClasses="character", header=T)
        tb01$final.time<-paste(tb01[,1],tb01[,2],sep=" ")
        tb01$final.time<-strptime(tb01$final.time,"%d/%m/%Y %H:%M:%S")
        tb01$final.time<-as.POSIXlt(tb01$final.time)
        tb01$dayweek<-weekdays(tb01$final.time)
        minD<-"2007/31/01"
        maxD<-"2007/03/02 "
        minD<-as.Date(minD,"%Y/%d/%m")
        maxD<-as.Date(maxD,"%Y/%d/%m")
        tb01[,1]<-as.Date(tb01[,1],"%d/%m/%Y")
        helpel<-as.POSIXlt(tb01[,1])> as.POSIXlt(minD) & as.POSIXlt(tb01[,1])<as.POSIXlt(maxD)
        tb001<-tb01[helpel,]
        tb001[,7]<-as.numeric(tb001[,7])
        tb001[,8]<-as.numeric(tb001[,8])
        tb001[,9]<-as.numeric(tb001[,9])
        tb001$hdate<-strftime(tb001$final.time,"%a %Y/%m/%d %H:%M:%S")
        png(file="plot3.png")
        par(bg = 'transparent')
        Sys.setlocale("LC_TIME", "C")
        plot(tb001$final.time,tb001[,7],pch="",xlab="",ylab="Energy sub metering")
        lines(tb001$final.time,tb001[,7])
        lines(tb001$final.time,tb001[,8],col="red")
        lines(tb001$final.time,tb001[,9],col="blue")
        legend("topright",lty=1,col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
        par(bg = 'transparent')
        dev.off()
}