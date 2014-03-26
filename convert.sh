#!/bin/bash

#PBS -S /bin/bash
#PBS -N Ray-k49-HiSeq-2500-NA12878-demo-2x150-2013-01-31-3
#PBS -o Ray-k49-HiSeq-2500-NA12878-demo-2x150-2013-01-31-3.stdout
#PBS -e Ray-k49-HiSeq-2500-NA12878-demo-2x150-2013-01-31-3.stderr
#PBS -A nne-790-ac
#PBS -l walltime=48:00:00
#PBS -l qos=SPJ1024
#PBS -l nodes=64:ppn=8
#PBS -M sebastien.boisvert.3@ulaval.ca
#PBS -m bea
cd $PBS_O_WORKDIR

# type: torus
# radix=8
# dimension=3
# vertices= radix^dimension = 512
# degree = 6

source /rap/nne-790-ab/software/NGS-Pipelines/LoadModules.sh

mpiexec -n 512 \
Ray \
-write-kmers \
-route-messages -connection-type torus -routing-graph-degree 6 \
-read-write-checkpoints HiSeq-2500-NA12878-demo-2x150.checkpoints-n512-k49.RayTechnologies \
 -o \
 Ray-k49-HiSeq-2500-NA12878-demo-2x150-2013-01-31-3 \
 -k 49 \
-p \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L001_R1_001.fastq.gz \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L001_R2_001.fastq.gz \
-p \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L001_R1_002.fastq.gz \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L001_R2_002.fastq.gz \
-p \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L002_R1_001.fastq.gz \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L002_R2_001.fastq.gz \
-p \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L002_R1_002.fastq.gz \
      HiSeq-2500-NA12878-demo-2x150/sorted_S1_L002_R2_002.fastq.gz \

