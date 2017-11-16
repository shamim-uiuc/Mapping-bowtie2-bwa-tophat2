#!/bin/bash

#Mapping RNA-Seq reads
#Dependcies: tophat2
#bowtie2 indexes required: bowtie2-build reference_genome.fa index_basename

gff_dir=/shared_annotation/soybean.gff
genome_index_dir=/shared_resources/genomes/soybean
output_dir=/shared_resources/shamim_share/Tophat_output
cd /shared_resources/shamim_share/RNASeq/data_trimmed

for fn in $(find -name '*.fq'); do
    base=$(basename $fn "*.fq")
    tophat2 -p 24 -G ${gff_dir} -o ${output_dir}/${base} ${genome_index_dir}/GMax ${fn}
    echo "tophat2 -p 24 -G ${gff_dir} -o ${output_dir}/${base} ${genome_index_dir}/GMax ${fn}"
done
