# Docker + R example

This repo contains a very basic example of using
docker to create a reproducable R environment.

Note this is a very basic example, there is no
fancy GUI.

## Usage

### Building

To build the image run

```
docker build --tag r-example .
```

at the project root.
This will:

- install the R version
specified in first line of the `Dockerfile`
(currently `4.0.0`)
- install the [versions](https://cran.r-project.org/web/packages/versions/index.html) package
- copy the `requirements.R` file in to the container, and execute it using `Rscript`
- Create a user called `default`, and set up a home directory
- Copy the contents of the `scripts` directory into the home directory

### Running

To enter the container with an interactive R session:

```
docker run -it  docker run -ti --rm r-example
```

Scripts can be run using `source`, for example: `source("./analysis.R")`

Alternatively, the container can be entered with an interactive bash session.

```
docker run -ti --rm r-example /bin/bash
```

In this case scripts can be run using `Rscript`, for example: `Rscript analysis.R`
