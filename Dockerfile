FROM rocker/r-ver:4.0.0
LABEL MAINTAINER "Mark Wibrow"


RUN apt-get update && apt-get -y --no-install-recommends install \
    build-essential \
    python3.7 python3-pip python3-setuptools python3-dev \
    libxt6 \
    wget 
RUN pip3 install jupyter

RUN mkdir -p /tmp
WORKDIR /tmp
RUN wget https://cran.r-project.org/src/contrib/versions_0.3.tar.gz
RUN R CMD INSTALL /tmp/versions_0.3.tar.gz
RUN R --quiet -e "versions::install.versions('IRkernel', '1.1')"
RUN R --quiet -e "IRkernel::installspec(user = FALSE)"
COPY requirements.R .
RUN Rscript requirements.R 

RUN groupadd -g 1001 r-user
RUN useradd -ms /bin/bash -g r-user --home-dir /usr/home/r-user r-user
RUN mkdir /usr/home/r-user/analysis
RUN chown r-user:r-user /usr/home/r-user/analysis
WORKDIR /usr/home/r-user/analysis

USER r-user