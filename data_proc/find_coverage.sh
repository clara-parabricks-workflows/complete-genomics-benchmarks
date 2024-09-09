#!/bin/bash 

# FASTQ_1="G400_PE150_NA12878_WGS_V300046476_L01_1.fq.gz"
# FASTQ_2="G400_PE150_NA12878_WGS_V300046476_L01_2.fq.gz"

# # STEP ONE: FQ2BAM 
# docker run --rm --gpus all \
#     -v `pwd`/data:/data \
#     -v `pwd`/outdir:/outdir \
#     nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
#     pbrun fq2bamfast \
#     --ref /data/ref/Homo_sapiens_assembly38.fasta \
#     --in-fq /data/${FASTQ_1} /data/${FASTQ_2} \
#     --out-bam /outdir/out.bam \
#     --low-memory

# STEP TWO: BAMMETRICS  
# docker run --rm --gpus all \
#     -v `pwd`/data:/data \
#     -v `pwd`/outdir:/outdir \
#     nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
#     pbrun bammetrics \
#     --ref /data/ref/ucsc.hg19.fasta \
#     --bam /outdir/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.bam \
#     --out-metrics-file /outdir/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1_metrics.txt

# docker run --rm --gpus all \
#     -v `pwd`/data:/data \
#     -v `pwd`/outdir:/outdir \
#     nvcr.io/nvidia/clara/clara-parabricks:4.3.1-1 \
#     pbrun bammetrics \
#     --ref /data/ref/ucsc.hg19.fasta \
#     --bam /outdir/T7_PE150_NA12878_WES_sample4_1.bam \
#     --out-metrics-file /outdir/T7_PE150_NA12878_WES_sample4_1_metrics.txt

# # STEP THREE: DOWNSAMPLE 
# for s in G400_PE150_NA12878_WGS_V300046476_L01_1 G400_PE150_NA12878_WGS_V300046476_L01_2
# do
#         gunzip "${s}.fq.gz"
#         seqtk sample -s100 "${s}.fq" 0.75 > ${s}_33x.fq
#         rm "${s}.fq"
#         gzip ${s}_33x.fq
# done

# STEP FOUR: RUN BAMSTATS
./bamstats -i ../outdir/G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.bam -o G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.bamstats.txt
./bamstats -i ../outdir/T7_PE150_NA12878_WES_sample4_1.bam -o T7_PE150_NA12878_WES_sample4_1.bamstats.txt
./bamstats -i ../outdir/G400_PE150_NA12878_WGS_V300046476_L01_1_33x.bam -o G400_PE150_NA12878_WGS_V300046476_L01_1_33x.bamstats.txt
./bamstats -i ../outdir/E100030471QC960_L01_48_1_33x.bam -o E100030471QC960_L01_48_1_33x.bamstats.txt
