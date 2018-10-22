#!/bin/bash
#TBI Lab
#Oct, 2018

#============users to be edited
#full path of the raw data is
sourcedata="/scratch/zhans23/siwei/CNV/chr9_region_user.txt"
#full path of the directory where you want to save the outputs and results
directory="/scratch/zhans23/siwei/CNV/"
#the full path of the directory where you want to save the split sample files
splitsample="/scratch/zhans23/siwei/CNV/chr9_region_user.txt/allfiles/"

#to find unique sample ID(long time)
#gawk '!seen[$2]++' ${sourcedata}> ${directory}samplelist 

#split the very large data file 
#column 2 is the sampleID
cd ${splitsample}
gawk '{print $0 >> $2".txt"}' ${sourcedata}
cd --
