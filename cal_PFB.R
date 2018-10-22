#!/usr/bin/env Rscript
#TBI Lab
#October, 2018

#example 
#Rscript cal_PFB.R "home directory where you saved your raw data" "resultdir where you save your outputs"

args=commandArgs(TRUE)
options(scipen = 999)
homedir=args[1]
resultdir=args[2]
source(paste(homedir,"commandArgs.R",sep = ""))


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

orig_snpdata<-read.table(rawdata,header = FALSE,sep="\t")
colnames(orig_snpdata)=c("Name","Sample","Chr","Position","B Allele Freq","Log R Ratio")

write.table(cal_PFB(orig_snpdata),
            paste(resultdir,"snpinfo",sep=""),
            row.names=FALSE,quote = FALSE,sep = "\t")



