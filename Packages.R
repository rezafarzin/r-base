install.packages(
  c(
    "devtools",
    "curl",
    "fpp2",
    "tsfeatures",
    "ISLR",
    "GGally",
    "scatterplot3d",
    "dbscan",
    "aws.ec2metadata",
    "iptools",
    "xml2",
    "rvest",
    "tidyverse",
    "tidygraph",
    "ggraph",
    "sergeant",
    "jsonlite",
    "logging",
    "rJava",
    "RJDBC",
    "sweep",
    "collapsibleTree",
    "ISOcodes"),
    dependencies = TRUE)

devtools::install_github("hrbrmstr/sergeant-caffeinated")

install.packages("aws.s3", repos = c("cloudyr" = "http://cloudyr.github.io/drat"))

install.packages('https://cran.r-project.org/src/contrib/Archive/arrow/arrow_0.16.0.tar.gz', repos=NULL, type="source")
