#!/bin/bash

# Note: Make sure to uncomment L4/H100 
# Note: Make sure all these input files are in the data dir 

# Sample T7 - WGS
./germline.sh E100030471QC960_L01_48_1_33x.fq.gz E100030471QC960_L01_48_2_33x.fq.gz
./deepvariant.sh E100030471QC960_L01_48_1_33x.bam 

# Sample T7 - WES
./germline.sh T7_PE150_NA12878_WES_sample4_1.fq.gz T7_PE150_NA12878_WES_sample4_2.fq.gz 
./deepvariant.sh T7_PE150_NA12878_WES_sample4_1.bam

# Sample G400 - WES
./germline.sh G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.fq.gz G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.2.fq.gz
./deepvariant.sh G400_PE150_NA12878_WES_MGIEasy_V5_Universal_Library_2.1.bam

# Sample G400 - WGS
./germline.sh G400_PE150_NA12878_WGS_V300046476_L01_1_33x.fq.gz G400_PE150_NA12878_WGS_V300046476_L01_2_33x.fq.gz
./deepvariant.sh G400_PE150_NA12878_WGS_V300046476_L01_1_33x.bam 