#!/usr/bin/bash

echoerr() { printf "%s\n" "$*" >&2; }

# Load the conda environment
if [ -z "$CONDA_DEFAULT_ENV" ]; then
	echoerr "Load the conda environment ..."
	conda activate xhmm_germlineCNV
fi

# Run snakemake workflow via bsub
echoerr "Launch the LSF/bsub master job to run snakemake ..."

bsub -a 'docker(lbwang/dailybox)' -q research-hpc -N -oo xhmm_germlineCNV_snakemake.log env SHELL='/bin/bash' snakemake --rerun-incomplete --latency-wait 30 --nolock --jobs 100 --cluster './bsub_submitter.py {dependencies} lsf_logs' --cluster-config bsub_config.json -p all
