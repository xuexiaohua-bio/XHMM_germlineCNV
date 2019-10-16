# XHMM_germlineCNV

## Description:
A Snakemake workflow to call germline copy number variants (CNVs).
This workflow uses XHMM for calling germline CNVs, based on the work published by Fromer and Purcell, 2014.
Please cite their work if using this workflow in your projects.

As described in the XHMM manual, "XHMM was explicitly designed to be used with targeted exome sequencing at high coverage (at least 60x - 100x) using Illumina HiSeq (or similar) sequencing of at least ~50 samples."

Running this pipeline on less than 50 samples may result in an empty .vcf, so running on ≥50 samples is strongly recommended. 

##### The original software manual can be found here:
https://atgu.mgh.harvard.edu/xhmm/tutorial.shtml

##### References:
https://www.nature.com/articles/ng.3638

https://www.ncbi.nlm.nih.gov/pmc/articles/PMC4065038/

#### Original workflow written by Yige Wu (only suitable for Google Cloud):
https://github.com/yigewu/xhmm_google_cloud

## External dependency files:

The XHMM workflow requires two dependency files for the analysis: a interval file and a seqdb file.

Interval files have been downloaded from UCSC table browser for both grch37 and grch38 and provided with this repository (see Files/IntervalFiles diretory).

seqdb files are databases for the human genome sequence generated with plinkseq.
These files are available at MGI for both grch37 and grch38:
- b37: `/gscmnt/gc3020/dinglab/fernanda/Projects/XHMM_germlineCNV/Files/SEQDB/b37/seqdb.hg19`
- b38: `/gscmnt/gc3020/dinglab/fernanda/Projects/XHMM_germlineCNV/Files/SEQDB/b38/seqdb.hg38`

Information on how to generate seqdb files are available at the plinkseq webpage (https://atgu.mgh.harvard.edu/plinkseq/resources.shtml) or at MGI at `/gscmnt/gc3020/dinglab/fernanda/Projects/XHMM_germlineCNV/Files/SEQDB/b37/README`.

## How to start a run on MGI:

### Set-up:

#### 1. Install Miniconda3:
- Download and install Miniconda 3 with:

`$ wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh`

`$ bash Miniconda3-latest-Linux-x86_64.sh`

#### 2. Clone the XHMM_germlineCNV repository: 
`$ git clone https://github.com/ding-lab/XHMM_germlineCNV.git`

#### 3. Change the priority of conda channels:

`$ conda config --add channels defaults`

`$ conda config --add channels bioconda`

`$ conda config --add channels conda-forge`

`$ conda config --add channels hcc`


#### 4. Create a conda environment: 
`$ conda create -n xhmm_germlineCNV python=3.6 snakemake-minimal=5.4.5 pandas plinkseq`

#### 5. Activate environment:
`$ conda activate xhmm_germlineCNV`

#### 6. Install gatk3.8:
`$ conda install -c bioconda/label/cf201901 gatk`

NOTE: In order for gatk3.8 to run properly, do the following:

Download archived version of gatk to folder:

`$ https://software.broadinstitute.org/gatk/download/auth?package=GATK-archive&version=3.8-1-0-gf15c1c3ef`

Run the following command:

`$ gatk3-register /path/to/GenomeAnalysisTK.jar`

#### 7. Deactivate environment and add path to .bashrc
This step is necessary to prevent jobs from dying in case the connection with MGI breaks. 
    
   `$ conda deactivate`

   Add this line to .bashrc:
   
   `export PATH="path/to/miniconda3/envs/xhmm_germlineCNV/bin:$PATH"` 

   Source .bashrc:
   
   `$ source ~/.bashrc`

#### 8. Go to XHMM folder in cloned git repository:
`$ cd path/to/XHMM_germlineCNV/XHMM`

#### 9. Edit config.yaml file:
- Change the path to reference genome you are using.
- Change the path to interval list file and seqdb file according to genome build you are using (default = grh37).
    Note that we have a copy of each of these files for both grch37 and grch38 which are downloaded when git repository is cloned (location: XHMM_germlineCNV/Files)

#### 10. Modify sample.txt according to your needs (at least 50 samples strongly recommended):
- sample.txt must be in the format: sample\tbampath\n .

Add the sample ids and path to the sample BAM files you are using.


### Running XHMM_germlineCNV:

To run the workflow, run (remember to modify config.yaml and sample.txt files according to your needs):

`$ cd path/to/XHMM_germlineCNV/XHMM`

`$ bash run.sh`
