# XHMM_germlineCNV

## Description:
A Snakemake workflow to call germline copy number variants (CNVs).

## Installation and usage (currently only running on MGI):

1. Clone the repository: 
- `git clone https://github.com/ding-lab/XHMM_germlineCNV.git`

2. Change the priority of conda channels:

- `conda config --add channels defaults`
- `conda config --add channels bioconda`
- `conda config --add channels conda-forge`
- `conda config --add channels hcc`

3. Create a conda environment: 
- `conda create -n xhmm_germlineCNV python=3.6 snakemake pandas plinkseq`
 
4. Install gatk3.8:
- `conda install -c bioconda/label/cf201901 gatk`

NOTE: In order for gatk3.8 to run properly, do the following:

Download archived version of gatk to folder:
- `https://software.broadinstitute.org/gatk/download/auth?package=GATK-archive&version=3.8-1-0-gf15c1c3ef`

Run the following command:
- `gatk3-register /path/to/GenomeAnalysisTK.jar`

5. Activate environment: 
- `conda activate snakemake`


