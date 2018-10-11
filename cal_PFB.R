#!/usr/bin/env Rscript
#TBI Lab
#October, 2018


args=commandArgs(TRUE)
options(scipen = 999)
homedir=args[1]
resultdir=args[2]
source(paste(homedir,"commandArgs.r",sep = ""))


#calculate PFB

cal_PFB=function(orig_snpdata){
  pfb<-tapply(orig_snpdata[,"B Allele Freq"], 
           list(orig_snpdata$Name), mean,na.rm=TRUE)
  
  snpinfo<-data.frame(cbind(pfb,orig_snpdata$Chr,orig_snpdata$Position))
  snpinfo$Name=rownames(snpinfo)
  colnames(snpinfo)=c("PFB","Chr","Position","Name")
  snpinfo=snpinfo[,c("Name","PFB","Chr","Position")]
  
  return(snpinfo)
}

cat("The full path of the file: ")
rawdata<-readLines(con="stdin",1)

orig_snpdata<-read.table(rawdata,header = TRUE)

write.table(cal_PFB(orig_snpdata),
            paste(resultdir,"snpinfo",sep=""),
            row.names=FALSE,quote = FALSE,sep = "\t")



