#!/usr/bin/env Rscript
#TBI Lab
#October, 2018

#example 
#Rscript genoCN.R "home directory where you saved your raw data" "resultdir where you save your outputs" "folder where you saved the separate sample files"

args=commandArgs(TRUE)
options(scipen = 999)
homedir=args[1]
resultdir=args[2]
folder=args[3]
samplelist_CNV=args[4]
#source(paste(homedir,"commandArgs.R",sep = ""))

#source("https://bioconductor.org/biocLite.R")
#biocLite("genoCN")
library(genoCN)

#you need to create a list of sampleID and named samplelist_CNV before running this script
samplelist_CNV=read.table(paste(homedir,samplelist_CNV,sep=""),header=FALSE)
file_list=as.character(samplelist_CNV$V1)
sampledata=list()
sampledata=lapply(file_list, function(x) 
                       read.table(paste(folder, x, sep=''), 
                                  header = FALSE,
                                  stringsAsFactors = FALSE))
                                  

#read in snpinfo file
snpinfo=read.table(paste(homedir,"snpinfo",sep=""),header = TRUE,sep = "\t")
#sort
snpinfo=snpinfo[order(snpinfo$Position),]
##plot sample1
#par(new=TRUE)
for (i in 1:nrow(samplelist_CNV)) {
    colnames(sampledata[[i]])=c("Name","Sample","Chr","Position","B Allele Freq","Log R Ratio")
    sampledata[[i]]=sampledata[[i]][order(sampledata[[i]]$Position),]
png(paste(resultdir,"jak2case",i,".png",sep=""),type="cairo",width=1000)
  plotCN(pos=snpinfo$Position,LRR = sampledata[[i]][,"Log R Ratio"],LRR.ylim=c(-0.5,0.5),
  BAF = sampledata[[i]][,"B Allele Freq"],main = paste("case:sample ",i," on chr9"))
}

