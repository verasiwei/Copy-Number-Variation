#!/usr/bin/env Rscript
#TBI Lab
#October, 2018

#example 
#Rscript subset.R "home directory where you saved your raw data"
#example of the columns you want to select:
#"Name","Chr","Position","B Allele Freq","Log R Ratio"

args=commandArgs(TRUE)
options(scipen = 999)
homedir=args[1]
resultdir=args[2]
source(paste(homedir,"commandArgs.r",sep = ""))

#
#separate the sigintensityall.txt into each sample
#read in data

#split data
subsetfunction<-function(orig_snpdata,select_name){
  splitdata=split(orig_snpdata,orig_snpdata$SampleID)
  samplenames=names(splitdata)
  listfiles=c()
  
  for(name in samplenames){
    savename = paste0(name, '.txt')
    write.table(splitdata[[name]][,select_name],
                paste(resultdir,savename,sep=""),sep = "\t",
                row.names=FALSE,quote = FALSE)
    listfiles=c(listfiles,savename)
  }
  listfiles=data.frame(listfiles)
  return(listfiles)
}

cat("The full path of the file: ")
rawdata<-readLines(con="stdin",1)

cat("The columns you want to include in the output file: ")
col_names<-readLines(con="stdin",1)

orig_snpdata<-read.table(rawdata,header = TRUE)
select_name<-c(col_names)

write.table(subsetfunction(orig_snpdata,select_name),
            paste(resultdir,"listfiles",sep=""),
            row.names=FALSE,col.names=FALSE,quote = FALSE)

