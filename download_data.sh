#!/bin/bash 

mkdir -p data
cd data

# T7 NA12878 data
# WGS
wget https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_1.fq.gz --no-check-certificate
wget https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_2.fq.gz --no-check-certificate

# WES
wget https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_1.fq.gz --no-check-certificate
wget https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_2.fq.gz --no-check-certificate 

# G400 NA12878 data
# WGS
wget https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz --no-check-certificate
wget https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz --no-check-certificate

# WES
wget https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz --no-check-certificate
wget https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz --no-check-certificate

mkdir -p ref
cd ref

# TODO: DOWNLOAD REFERENCE
# hg19.fa
# dbsnp_151.vcf.gz
# 1000G_phase1.indels.hg19.vcf.gz
# Mills_and_1000G_gold_standard.indels.hg19.vcf.gz

cd - 
cd - 

mkdir -p deepvariant_models
cd deepvariant_models 

# T7 weights 
HTTPDIR=https://storage.googleapis.com/deepvariant/complete-case-study-testdata
curl ${HTTPDIR}/complete-t7/weights-51-0.995354.ckpt.data-00000-of-00001 > input/weights-51-0.995354.ckpt.data-00000-of-00001
curl ${HTTPDIR}/complete-t7/weights-51-0.995354.ckpt.index > input/weights-51-0.995354.ckpt.index

# G400 weights 
HTTPDIR=https://storage.googleapis.com/deepvariant/complete-case-study-testdata
curl ${HTTPDIR}/complete-g400/weights-60-0.993753.ckpt.data-00000-of-00001 > input/weights-60-0.993753.ckpt.data-00000-of-00001
curl ${HTTPDIR}/complete-g400/weights-60-0.993753.ckpt.index > input/weights-60-0.993753.ckpt.index

cd - 