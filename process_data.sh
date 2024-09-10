#!/bin/bash 

# 1. Run bammetrics and bamstats on original data 

G400_WGS_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
G400_WGS_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
G400_WGS_BAM="$(basename -s .fq.gz $G400_WGS_FASTQ_1).bam"
./scripts/fq2bamfast.sh ${G400_WGS_FASTQ_1} ${G400_WGS_FASTQ_2} ${G400_WGS_BAM}
./scripts/bammetrics.sh ${G400_WGS_BAM}
./scripts/bamstats.sh ${G400_WGS_BAM}

T7_WGS_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
T7_WGS_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
T7_WGS_BAM="$(basename -s .fq.gz $T7_WGS_FASTQ_1).bam"
./scripts/fq2bamfast.sh ${T7_WGS_FASTQ_1} ${T7_WGS_FASTQ_2} ${T7_WGS_BAM}
./scripts/bammetrics.sh ${T7_WGS_BAM}
./scripts/bamstats.sh ${T7_WGS_BAM}

G400_WES_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
G400_WES_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
G400_WES_BAM="$(basename -s .fq.gz $G400_WES_FASTQ_1).bam"
./scripts/fq2bamfast.sh ${G400_WES_FASTQ_1} ${G400_WES_FASTQ_2} ${G400_WES_BAM}
./scripts/bammetrics.sh ${G400_WES_BAM}
./scripts/bamstats.sh ${G400_WES_BAM}

T7_WES_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
T7_WES_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
T7_WES_BAM="$(basename -s .fq.gz $T7_WES_FASTQ_1).bam"
./scripts/fq2bamfast.sh ${T7_WES_FASTQ_1} ${T7_WES_FASTQ_2} ${T7_WES_BAM}
./scripts/bammetrics.sh ${T7_WES_BAM}
./scripts/bamstats.sh ${T7_WES_BAM}

# 2. Downsample data to 33x based on coverage from bammetrics 

# ./scripts/downsample.sh ${G400_FASTQ_1} 0.75
# ./scripts/downsample.sh ${G400_FASTQ_2} 0.75
# ./scripts/downsample.sh ${T7_FASTQ_1} 0.75
# ./scripts/downsample.sh ${T7_FASTQ_2} 0.75 

# 4. Run bammetrics on downsample data 

# G400_WGS_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
# G400_WGS_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
# G400_WGS_BAM_33x="$(basename -s .fq.gz $G400_WGS_FASTQ_1).33x.bam"
# ./scripts/fq2bamfast.sh ${G400_WGS_FASTQ_1} ${G400_WGS_FASTQ_2} ${G400_WGS_BAM_33x}
# ./scripts/bammetrics.sh ${G400_WGS_BAM_33x}
# ./scripts/bamstats.sh ${G400_WGS_BAM_33x}

# T7_WGS_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
# T7_WGS_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
# T7_WGS_BAM_33x="$(basename -s .fq.gz $T7_WGS_FASTQ_1).33x.bam"
# ./scripts/fq2bamfast.sh ${T7_WGS_FASTQ_1} ${T7_WGS_FASTQ_2} ${T7_WGS_BAM_33x}
# ./scripts/bammetrics.sh ${T7_WGS_BAM_33x}
# ./scripts/bamstats.sh ${T7_WGS_BAM_33x}

# G400_WES_FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
# G400_WES_FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"
# G400_WES_BAM_33x="$(basename -s .fq.gz $G400_WES_FASTQ_1).33x.bam"
# ./scripts/fq2bamfast.sh ${G400_WES_FASTQ_1} ${G400_WES_FASTQ_2} ${G400_WES_BAM_33x}
# ./scripts/bammetrics.sh ${G400_WES_BAM_33x}
# ./scripts/bamstats.sh ${G400_WES_BAM_33x}

# T7_WES_FASTQ_1="E100030471QC960_L01_48_1.fq.gz"
# T7_WES_FASTQ_2="E100030471QC960_L01_48_2.fq.gz"
# T7_WES_BAM_33x="$(basename -s .fq.gz $T7_WES_FASTQ_1).33x.bam"
# ./scripts/fq2bamfast.sh ${T7_WES_FASTQ_1} ${T7_WES_FASTQ_2} ${G400_WES_BAM_33x}
# ./scripts/bammetrics.sh ${G400_WES_BAM_33x}
# ./scripts/bamstats.sh ${G400_WES_BAM_33x}
