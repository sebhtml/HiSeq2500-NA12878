#!/bin/bash

mkdir HiSeq-2500-NA12878-demo-2x150
cd HiSeq-2500-NA12878-demo-2x150

endpoint=http://maupiti.crchul.ulaval.ca:2280/pub/HiSeq-2500-NA12878-demo-2x150

wget $endpoint/RawFiles.txt
wget $endpoint/sha1sum.txt
wget $endpoint/README

wget $endpoint/sorted_S1_L001_R1_001.fastq.gz
wget $endpoint/sorted_S1_L001_R1_002.fastq.gz
wget $endpoint/sorted_S1_L001_R2_001.fastq.gz
wget $endpoint/sorted_S1_L001_R2_002.fastq.gz
wget $endpoint/sorted_S1_L002_R1_001.fastq.gz
wget $endpoint/sorted_S1_L002_R1_002.fastq.gz
wget $endpoint/sorted_S1_L002_R2_001.fastq.gz
wget $endpoint/sorted_S1_L002_R2_002.fastq.gz

sha1sum -c sha1sum.txt

cd ..

ls -lh HiSeq-2500-NA12878-demo-2x150

