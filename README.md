# Docker + R example

This repo contains a very basic example of using
docker to create a reproducable R environment
with jupyter notebooks.



## Usage

Run the following command at the project root

```
docker-compose up -d --build jupyter-r
```
This will:

- install the R version
specified in first line of the `Dockerfile`
(currently `4.0.0`)
- install the [versions](https://cran.r-project.org/web/packages/versions/index.html) package
- copy the `requirements.R` file in to the container, and execute it using `Rscript`
- create a user and link the user's home directory to the `analysis` folder in
the project root.

When the build process has completed 
(which will [take a while](https://xkcd.com/303/)), 
open a browser and point it to `127.0.0.1:8888`.
The Jupyter file explorer should appear.
