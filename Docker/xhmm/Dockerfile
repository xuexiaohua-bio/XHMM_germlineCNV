####################################
## Dockerfile to build XHMM image ##
## Based on Ubuntu		  ##
####################################

# Set the base image to Ubuntu
FROM ubuntu:xenial

# File Author / Maintainer
MAINTAINER Fernanda Martins Rodrigues <fernanda@wustl.edu>

# Brief description
LABEL \
  description="XHMM image for use in Workflows"

# Update the repository sources list and Install compiler and basics
RUN apt-get update && apt-get install --yes \
  build-essential \
  gcc-multilib \
  libpthread-stubs0-dev \
  liblapack-dev \
  unzip \
  make \
  gengetopt \
  wget \
  default-jre \
  default-jdk \
  csh \
  gawk \
  && apt-get clean

# Install XHMM
RUN wget https://bitbucket.org/statgen/xhmm/get/master.zip
RUN unzip master.zip
WORKDIR /statgen-xhmm-cc14e528d909
RUN make
