FROM rocker/r-ver:4.0.0
LABEL MAINTAINER "Mark Wibrow"

RUN mkdir -p /tmp

WORKDIR /tmp
RUN apt-get update && apt-get -y install wget
RUN wget https://cran.r-project.org/src/contrib/versions_0.3.tar.gz
RUN R CMD INSTALL /tmp/versions_0.3.tar.gz
COPY requirements.R .
RUN Rscript requirements.R 

RUN useradd -ms /bin/bash default
WORKDIR /usr/home/default
USER default

COPY ./scripts .
