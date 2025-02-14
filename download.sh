#!/bin/bash 

# Check that the environment variable is set 
if [[ ! -v NVME_DIR ]]; then
    echo "NVME_DIR environment variable is not set. Exiting."
    echo "export NVME_DIR=/opt/dlami/nvme"
    exit
fi

DATA_DIR="$PWD/data"
REF_DIR="$DATA_DIR/ref"

mkdir -p $DATA_DIR
mkdir -p $REF_DIR

# # Download data 
# cd $DATA_DIR && \
#     aws --profile complete s3 cp s3://cg-nvidia/30x_DL100002760_L01_NA12878_1.fq.gz . && \
#     aws --profile complete s3 cp s3://cg-nvidia/30x_DL100002760_L01_NA12878_2.fq.gz .

# # Download reference files 
# cd $REF_DIR && \
#     wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.dict.gz && gunzip ucsc.hg19.dict.gz && \
#     wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.gz && gunzip ucsc.hg19.fasta.gz && \
#     wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/ucsc.hg19.fasta.fai.gz && gunzip ucsc.hg19.fasta.fai.gz && \
#     wget https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz -O dbsnp_151.vcf.gz && \
#     wget https://ftp.ncbi.nih.gov/snp/organisms/human_9606_b151_GRCh37p13/VCF/All_20180423.vcf.gz.tbi -O dbsnp_151.vcf.gz.tbi && \
#     wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/Mills_and_1000G_gold_standard.indels.hg19.sites.vcf.gz && \
#     wget -c ftp://gsapubftp-anonymous@ftp.broadinstitute.org/bundle/hg19/1000G_phase1.indels.hg19.sites.vcf.gz 

# # Index reference files 
# cd $REF_DIR && bwa index ucsc.hg19.fasta

# # Note: Mills and 1000G need to be bgzipped and re-indexed 
# index_files=("Mills_and_1000G_gold_standard.indels.hg19.sites" "1000G_phase1.indels.hg19.sites")
# for index in ${index_files[@]}; do
#     cd $REF_DIR && \
#         gunzip $index.vcf.gz && \
#         bgzip $index.vcf && \
#         tabix -p vcf $index.vcf.gz 
# done

# T7 and G400 Data 
# cd $DATA_DIR && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_1.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0497793/E100030471QC960_L01_48_2.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_1.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0178967/T7_PE150_NA12878_WES_sample4_2.fq.gz  && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0175139/G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz && \
#     wget https://demodata.completegenomics.mgiamericas.com/CNR0117173/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz