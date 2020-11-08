
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

This package is currently under development. The API is likely to change
and some features are incomplete.

## Features

The goal of dbmanager is to provide connection management to the
following databases and compute engines.

|   Engine   |        Implemented         |
| :--------: | :------------------------: |
|   MySQL    | :heavy\_multiplication\_x: |
| PostgreSQL | :heavy\_multiplication\_x: |
| SQL Server | :heavy\_multiplication\_x: |
|  MonetDB   | :heavy\_multiplication\_x: |
|   SQLite   | :heavy\_multiplication\_x: |
|  CouchDB   | :heavy\_multiplication\_x: |
|   Spark    | :heavy\_multiplication\_x: |

## Installation

**dbmanager** is not yet on CRAN. You can install from GitHub with:

``` r
# install.packages("remotes")
remotes::install_github("eokodie/dbmanager")
```
