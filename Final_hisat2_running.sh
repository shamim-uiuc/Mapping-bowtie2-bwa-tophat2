#!/bin/bash
#hisat2 is another popular mapping tools for RNA-Seq
# Dependencies:hisat2, samtools
#Need to make indexes: hisat2-build reference_genome.fa index_base_name

for fn in $(find -name '*.fq'); do
    base=$(basename $fn "*.fq")
    hisat2 -p 16 -x Genome_Indexes/Index -U $fn -S Sam_files/${base}.sam
    echo "hisat2 -p 16 -x Genome_Indexes/Index -U $fn -S Sam_files/${base}.sam
    samtools view -bS ${base%%.*}.sam > ${base%%.*}.bam
    echo "samtools view -bS ${base%%.*}.sam > ${base%%.*}.bam"
    samtools sort ${base%%.*}.bam ${base%%.*}_sorted
    echo "samtools sort ${base%%.*}.bam ${base%%.*}_sorted_file"
done
