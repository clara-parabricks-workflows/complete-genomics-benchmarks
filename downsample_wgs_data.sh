#!/bin/bash 

# FASTQ_1="$0"
# FASTQ_2="$1"

# # STEP ONE: FQ2BAM 
# docker run --rm --gpus all \
#     -v `pwd`/data:/data \
#     -v `pwd`/outdir:/outdir \
#     nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
#     pbrun fq2bamfast \
#     --ref /data/ref/Homo_sapiens_assembly38.fasta \
#     --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
#     --out-bam /outdir/out.bam \

# # STEP TWO: BAMMETRICS  
# docker run --rm --gpus all \
#     -v `pwd`/data:/data \
#     -v `pwd`/outdir:/outdir \
#     nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
#     pbrun bammetrics \
#     --ref /data/ref/Homo_sapiens_assembly38.fasta \
#     --bam /outdir/out.bam \
#     --out-metrics-file /outdir/metrics.txt

# STEP THREE: DOWNSAMPLE 

for s in E100030471QC960_L01_48_1
do
    gunzip "${s}.fq.gz"
    seqtk sample -s100 "${s}.fq" 0.75 > ${s}_33x.fq
    # rm "${s}.fq"
done

# for s in E100030471QC960_L01_48_1 E100030471QC960_L01_48_2 G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1 G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2
# do
#     gunzip "${s}.fq.gz"
#     seqtk sample -s100 "${s}.fq" 0.75 > ${s}_33x.fq
#     rm "${s}.fq"
# done

# for s in G400_PE150_NA12878_WGS_V300046476_L01_1 G400_PE150_NA12878_WGS_V300046476_L01_2 T7_PE150_NA12878_WES_sample4_1 T7_PE150_NA12878_WES_sample4_2
# do
#     gunzip "${s}.fq.gz"
#     seqtk sample -s100 "${s}.fq" 0.75 > ${s}_33x.fq
#     rm "${s}.fq"
# done