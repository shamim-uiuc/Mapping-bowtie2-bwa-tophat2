#!/bin/bash

#Mapping fastq files using bowtie2
#Dependencies: bowtie2, samtools
#Need to make index using the following command: bowtie2_build refernce_genome.fa index_base_name
#Output will be sorted bam files

for fn in $(find -name '*.fq'); do
    base=$(basename $fn "*.fq")
    bowtie2 --un Host_sequence_removed/${base}.fq --threads 16 -x Genome_Indexes/Index -U $fn -S Sam_files/${base}.sam
    echo "bowtie2 --un Host_sequence_removed/${base}.fq --threads 16 -x Genome_Indexes/Index -U $fn -S Sam_files/${base}.sam"
    samtools view -bS ${base%%.*}.sam > ${base%%.*}.bam
    echo "samtools view -bS ${base%%.*}.sam > ${base%%.*}.bam"
    samtools sort ${base%%.*}.bam ${base%%.*}_sorted
    echo "samtools sort ${base%%.*}.bam ${base%%.*}_sorted_file"
done

