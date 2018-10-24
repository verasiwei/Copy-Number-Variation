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

#source("https://bioconductor.org/biocLite.R")
#biocLite("genoCN")
library(genoCN)

#read in snpinfo file
snpinfo=read.table(paste(homedir,"snpinfo",sep=""),header = TRUE,sep = "\t")
#sort
snpinfo=snpinfo[order(snpinfo$Position),]

#you need to create a list of sampleID and named samplelist_CNV before running this script
samplelist_CNV=read.table(paste(homedir,"samplelist_CNV",sep=""),header=FALSE)
file_list=as.character(samplelist_CNV$V1)
sampledata=list()
sampledata=lapply(file_list, function(x) 
                       read.table(paste(folder, x, sep=''), 
                                  header = FALSE,
                                  stringsAsFactors = FALSE))


#run genoCNV to identify CNV regions
Theta=list()
for (i in 1:nrow(samplelist_CNV)){
colnames(sampledata[[i]])=c("Name","Sample","Chr","Position","B Allele Freq","Log R Ratio")
Theta[[i]]=genoCNV(snpinfo$Name,snpinfo$Chr,snpinfo$Position,
sampledata[[i]][,"Log R Ratio"],sampledata[[i]][,"B Allele Freq"],snpinfo$PFB,
sampleID=sampledata[[i]]$Sample[1],
outputSeg=TRUE,outputSNP = 1, outputTag =sampledata[[i]]$Sample[1])
}