#!/bin/bash
#TBI Lab
#Oct, 2018

#============users to be edited
#full path of the raw data is
sourcedata=" "
#full path of the directory where you want to save the outputs and results
directory=""
#the full path of the directory where you want to save the split chromosome files
splitsample=""
#the chromosome you want to select
chr=""
#the maximum physical position you want to select
bp_max=""
#the minimum physical position you want to select
bp_min=""


#extract a specific chromosome file of all people from the raw intensity file 
gawk '$17=="$chr" || NR==1 {print}' ${sourcedata} > ${directory}chr${chr}.txt
#remove duplicated positions for each people on this chromosome (all people)
##column 2 is sampleID and column 4 is the physical position
gawk '!seen[$2$4]++ {print}' ${directory}chr${chr}.txt > ${directory}chr${chr}_nodup.txt

#select the specific region on a chromosome from the chr${chr}_nodup.txt(all people)
##column 4 is the physical position
gawk '$4<="$bp_max" && $4>="$bp_min" {print}' OFS="\t" ${directory}chr${chr}_nodup.txt > ${directory}chr${chr}_region_user.txt
##add header to this file
#echo -e "Name\tChr\tSample\tPosition\tB Allele Freq\tLog R Ratio" | cat - ${directory}chr${chr}_region_user.txt> ${directory}chr${chr}_region_user_head.txt