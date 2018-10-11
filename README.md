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

You may get a file from genotyping center such like Illumina which includes SNP name, sample ID, B allele frequency, Log R Ratio and some 
other information. Here we only need SNP name, sample ID, B allele frequency and Log R Ratio. It is usually a very large file. We need to 
subset this file based on each sample. You can use the subset.r script here to subset this file. (Please rename the header of your raw file to Name, SampleID, Chr, Position, B Allele Freq, Log R Ratio)

Input files: You can use the rscipts here to prepare these input files.

* snpdata which includes the name, Log R Ratio and B allele Frequency of each snp.

* snpinfo which includes the name, chromosome, physical position, population frequency of B allele.


1. Run cal_PFB to calculate the population B allele Frequency
2. Run subset.r to subset the raw intensity file
3. Run
