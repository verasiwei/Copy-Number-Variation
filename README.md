# Copy-Number-Variation

Copy number variation (CNV) is a phenomenon that the number of a section of a chromosome is different from the expected number of copies due
to duplication or deletion, of which can be ranged from kb to Mb base on the genetic distance. 

Copy neutral loss of heterozygosity(Copy-neutral LOH) is an event that results in loss of the entire gene and the surrounding chromosome
region. Most of the chromosomes within somatic cells of individuals are paired of which SNP locations are heterozygous, but one parental
of a region can sometimes be lost that this region only have one copy. It differs from CNV that CN-LOH do not include any net change
(translocations) in the copy number. 

Hidden Markov Model (HMM) is used to infer copy number states and genotypes from SNP array data. 

This pipeline is based on R package: genoCN
References: https://academic.oup.com/nar/article/37/16/5365/2409859

## Procedures:

You may get a file from genotyping center such like Illumina which includes SNP name, sample ID, B allele frequency, Log R Ratio, Chromosome, Physical position and some other information. Here we only need SNP name, sample ID, B allele frequency and Log R Ratio. 

It is usually a very large file. We need to subset this file based on each sample. You can use both the subset_sample.r script or subset_sample.sh here to subset this file, but I recommand to use subset_sample.sh script since it takes long time to read the original data in R (Please rename the header of your raw file to Name, SampleID, Chr, Position, B Allele Freq, Log R Ratio if using subset.r). 

We always focus on a specific region on a specific chromosome, subset_chr.sh is used to select the specific chromosome and select the specific region users defined.

Input files: You can use the rscipts ans shellscripts here to prepare these input files.

* snpdata which includes the name, Log R Ratio and B allele Frequency of each snp.

* snpinfo which includes the name, chromosome, physical position, population frequency of B allele.

## Prepare Input Data Files

1. subset_chr.sh is used to select the specific chromosome and select the specific region for all samples and to get a file used in calculating PFB
2. subset_sample.R or subset_sample.sh is used to subset samples and to get separte sample files
3. cal_PFB is used to calculate the population B allele Frequency and to get the snpinfo file， you need to run subset_chr.sh to get a region specified for all samples file and run subset_sample.R or subset_sample.sh to get the separate sample files before running this script

## Identify CNV

1. commandArgs.R is used for users to input the directories
2. plotCN.R is used to plot.
3. genoCN.r is used to identify genoCN

Example output of plotCN.R for the case of JAK2 V617F Mutation




