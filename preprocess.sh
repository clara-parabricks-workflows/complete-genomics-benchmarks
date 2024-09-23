#!/bin/bash 

# 1. Run bammetrics and bamstats on original data 

G400_WGS_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
G400_WGS_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
G400_WGS_BAM="$(basename -s .fq.gz $G400_WGS_FASTQ_1).bam"
# ./utils/fq2bamfast.sh ${G400_WGS_FASTQ_1} ${G400_WGS_FASTQ_2} ${G400_WGS_BAM}
./utils/bammetrics.sh ${G400_WGS_BAM}
./utils/bamstats.sh ${G400_WGS_BAM}

T7_WGS_FASTQ_1="E100030471QC960_L01_48_1.33x.fq.gz"
T7_WGS_FASTQ_2="E100030471QC960_L01_48_1.33x.fq.gz"
T7_WGS_BAM="$(basename -s .fq.gz $T7_WGS_FASTQ_1).bam"
# ./utils/fq2bamfast.sh ${T7_WGS_FASTQ_1} ${T7_WGS_FASTQ_2} ${T7_WGS_BAM}
./utils/bammetrics.sh ${T7_WGS_BAM}
./utils/bamstats.sh ${T7_WGS_BAM}

G400_WES_FASTQ_1="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz"
G400_WES_FASTQ_2="G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz"
G400_WES_BAM="$(basename -s .fq.gz $G400_WES_FASTQ_1).bam"
# ./utils/fq2bamfast.sh ${G400_WES_FASTQ_1} ${G400_WES_FASTQ_2} ${G400_WES_BAM}
./utils/bammetrics.sh ${G400_WES_BAM} "--interval-file /data/ref/MGI_Exome_Capture_V5.bed"
./utils/bamstats.sh ${G400_WES_BAM}

T7_WES_FASTQ_1="T7_PE150_NA12878_WES_sample4_1.fq.gz"
T7_WES_FASTQ_2="T7_PE150_NA12878_WES_sample4_2.fq.gz"
T7_WES_BAM="$(basename -s .fq.gz $T7_WES_FASTQ_1).bam"
# ./utils/fq2bamfast.sh ${T7_WES_FASTQ_1} ${T7_WES_FASTQ_2} ${T7_WES_BAM}
./utils/bammetrics.sh ${T7_WES_BAM} "--interval-file /data/ref/MGI_Exome_Capture_V5.bed"
./utils/bamstats.sh ${T7_WES_BAM}

# 2. Downsample data to 33x based on coverage from bammetrics 

./utils/downsample.sh ${T7_WGS_FASTQ_1} 0.65
./utils/downsample.sh ${T7_WGS_FASTQ_2} 0.65 

# 4. Run bammetrics again on downsample data to confirm 

T7_WGS_FASTQ_1_33x="$(basename -s .fq.gz $T7_WGS_FASTQ_1).33x.fq.gz"
T7_WGS_FASTQ_2_33x="$(basename -s .fq.gz $T7_WGS_FASTQ_2).33x.fq.gz"
T7_WGS_BAM_33x="$(basename -s .bam $T7_WGS_BAM).33x.bam"
./utils/fq2bamfast.sh ${T7_WGS_FASTQ_1_33x} ${T7_WGS_FASTQ_2_33x} ${T7_WGS_BAM_33x}
./utils/bammetrics.sh ${T7_WGS_BAM_33x}
./utils/bamstats.sh ${T7_WGS_BAM_33x}
