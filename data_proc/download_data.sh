#!/bin/bash 

# Note: Call this function from the root dir as ./data_procs/download_data.sh
# so the data folder gets made in the root directory. 

mkdir -p data
cd data

mkdir -p ref
cd ref

# HG19
axel ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.gz && gunzip ucsc.hg19.fasta.gz

# Note: Need to install bwa 
bwa index ucsc.hg19.fasta

# dbsnp_151.vcf.gz
axel https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz -o dbsnp_151.vcf.gz
axel https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz.tbi -o dbsnp_151.vcf.gz.tbi

# Mills_and_1000G_gold_standard.indels.hg38.vcf.gz
axel ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz
axel ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.idx.gz

# 1000G_phase1.snps.high_confidence.hg38.vcf.gz
axel ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_phase1.indels.hg19.sites.vcf.gz
axel ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_phase1.indels.hg19.sites.vcf.idx.gz

cd - 

# T7 NA12878 data
# WGS
axel https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_1.fq.gz 
axel https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_2.fq.gz 

# WES
axel https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_1.fq.gz 
axel https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_2.fq.gz  

# G400 NA12878 data
# WGS
axel https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz 
axel https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz 

# WES
axel https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz 
axel https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz 

cd - 

mkdir -p deepvariant_models
cd deepvariant_models 

# T7 weights 
HTTPDIR=https://storage.googleapis.com/deepvariant/complete-case-study-testdata
curl ${HTTPDIR}/complete-t7/weights-51-0.995354.ckpt.data-00000-of-00001 > weights-51-0.995354.ckpt.data-00000-of-00001
curl ${HTTPDIR}/complete-t7/weights-51-0.995354.ckpt.index > weights-51-0.995354.ckpt.index

# G400 weights 
curl ${HTTPDIR}/complete-g400/weights-60-0.993753.ckpt.data-00000-of-00001 > weights-60-0.993753.ckpt.data-00000-of-00001
curl ${HTTPDIR}/complete-g400/weights-60-0.993753.ckpt.index > weights-60-0.993753.ckpt.index

cd - 

