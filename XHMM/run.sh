#!/usr/bin/bash

echoerr() { printf "%s\n" "$*" >&2; }

# Load the conda environment
if [ -z "$CONDA_DEFAULT_ENV" ]; then
	echoerr "Load the conda environment ..."
	conda activate xhmm_germlineCNV
fi

# Decompress necessary files
gunzip ../Files/IntervalFiles/b37/GRCh37.ensGene.coding.exon.interval_list.gz
gunzip ../Files/IntervalFiles/b38/GRCh38.ensGene.coding.exon.interval_list.gz

# Run snakemake workflow via bsub
echoerr "Launch the LSF/bsub master job to run snakemake ..."

mkdir -p logs/snakemake_logs
mkdir -p logs/lsf_logs

bsub -a 'docker(lbwang/dailybox)' -q research-hpc -N -oo xhmm_germlineCNV_snakemake.log env SHELL='/bin/bash' snakemake --rerun-incomplete --latency-wait 30 --nolock --jobs 100 --cluster './bsub_submitter.py {dependencies} logs/lsf_logs' --cluster-config bsub_config.json -p all
