
<!-- README.md is generated from README.Rmd. Please edit that file -->

# dbmanager

<div data-align="center">

<!-- hex -->

<!-- <img src="./man/figures/logo.png" height = "200px" /> -->

<!-- badges: start -->

<!-- Experimental -->

[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->

<!-- links start -->

<!-- links end -->

</div>

> A consistent interface for managing connections to database and
> compute engines.

This package is currently under active development. The API is likely to
change and some features are incomplete.

## Features

The goal of `dbmanager` is to provide connection management to the
following databases and compute engines.

| Engine     |        Implemented         |
| :--------- | :------------------------: |
| MySQL      |    :heavy\_check\_mark:    |
| PostgreSQL |    :heavy\_check\_mark:    |
| SQL Server | :heavy\_multiplication\_x: |
| MonetDB    | :heavy\_multiplication\_x: |
| SQLite     | :heavy\_multiplication\_x: |
| CouchDB    | :heavy\_multiplication\_x: |
| MongoDB    | :heavy\_multiplication\_x: |
| Spark      | :heavy\_multiplication\_x: |

## Installation

`dbmanager` is not yet on CRAN. You can install from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("eokodie/dbmanager", ref = "main")
```

## Examples

`dbmanager` is implemented with R6 classes to give a consistent
interface to common databases and compute engines.

You can connect to a MySQL database with.

``` r
library(dbmanager)

db <- MySQL$new(
  db_name  = "mydb",
  host     = "test1", 
  user     = "user1", 
  password = "pwd1"
)

db$available_databases
db$connected_database
db$tables
# You can also get the pool object to run queries etc.
pool <- db$pool

db$close()
```

Similarly, you can connect to PostgreSQL with.

``` r
library(dbmanager)

db <- PostgreSQL$new(
  db_name  = "mydb2",
  host     = "test2", 
  user     = "user2", 
  password = "pwd2"
)

db$available_databases
db$connected_database
db$tables
pool <- db$pool

db$close()
```
