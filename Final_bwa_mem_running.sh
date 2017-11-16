!/bin/bash

#Mapping using bwa tools
# This tool is popular for variant calling analysis using GATK

genome_dir=/shared_resources/genomes/soybean

for fn in 'ls /shared_resources/shamim_resource/RNASeq_files/*.fastq'; do
    input_dir="/shared_resources/shamim_resource/RNASeq_files"
    base=$(basename $fn "_R1.fastq")
    bwa mem -M -t 16 ${genome_dir}/GMax.fa ${input_dir}/${base}_R1.fastq ${input_dir}/${base}_R2.fastq > Samfiles/${base}.sam
    echo "bwa mem -M -t 16 ${genome_index_dir}/GMax.fa ${input_dir}/${base}_R1.fastq ${input_dir}/${base}_R2.fastq > Samfiles/${base}.sam"
done

