#!/usr/bin/env Rscript
#TBI Lab
#October, 2018

#example 
#Rscript cal_PFB.R "home directory where you saved your raw data" "resultdir where you save your outputs"

args=commandArgs(TRUE)
options(scipen = 999)
homedir=args[1]
resultdir=args[2]
folder=args[3]
#source(paste(homedir,"commandArgs.R",sep = ""))


#calculate PFB

cal_PFB=function(orig_snpdata,onesample){
  pfb<-tapply(orig_snpdata[,"B Allele Freq"], 
           list(orig_snpdata$Name), mean,na.rm=TRUE)
  
  snpinfo<-data.frame(cbind(pfb,onesample$Chr,onesample$Position))
  snpinfo$Name=rownames(snpinfo)
  colnames(snpinfo)=c("PFB","Chr","Position","Name")
  snpinfo=snpinfo[,c("Name","PFB","Chr","Position")]
  write.table(snpinfo,
            paste(resultdir,"snpinfo",sep=""),
            row.names=FALSE,quote = FALSE,sep = "\t")
  return(snpinfodata=snpinfo)
}

cat("The full path of the file: ")
rawdata<-readLines(con="stdin",1)
cat("The full path of the onesample file: ")
rawonesample<-readLines(con="stdin",1)

origsnpdata<-read.table(rawdata,header = FALSE)
colnames(origsnpdata)=c("Name","Sample","Chr","Position","B Allele Freq","Log R Ratio")
onesamplefile=read.table(rawonesample,header = FALSE)
colnames(onesamplefile)=c("Name","Sample","Chr","Position","B Allele Freq","Log R Ratio")
cal_PFB(origsnpdata,onesamplefile)



