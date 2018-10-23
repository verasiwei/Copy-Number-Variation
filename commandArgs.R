#!/usr/bin/env Rscript
#TBI Lab
#October, 2018

args=commandArgs(TRUE)
options(scipen = 999)

cat("snpdata which includes Name, LRR and BAF is needed, please enter your snpdata file's name: ")
snpdata<-readLines(con="stdin",1)

cat("snpdata which includes Name, Chr, Position and PFB is needed, please enter your snpinfo file's name: ")
snpinfo<-readLines(con="stdin",1)  

cat("The full path of your home directory where you saved your raw data is need, please enter: ")
homedir<-readLines(con="stdin",1)

cat("The full path of your result directory where you want to save the outputs is need, please enter: ")
resultdir<-readLines(con="stdin",1)

cat("The full path of your result directory where you want to save the separate sample files, please enter: ")
folder<-readLines(con="stdin",1)





