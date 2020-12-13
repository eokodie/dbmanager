
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
| SQL Server |    :heavy\_check\_mark:    |
| MonetDB    |    :heavy\_check\_mark:    |
| SQLite     |    :heavy\_check\_mark:    |
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
interface to common databases and compute engines. We will illustrate
this with some code snippets.

Let’s begin with some credentials.

``` r
db_name  = Sys.getenv("db_name")
host     = Sys.getenv("host") 
user     = Sys.getenv("user") 
password = Sys.getenv("password")
```

We can connect to a **MySQL** database with.

``` r
library(dbmanager)

db <- MySQL$new(
  db_name  = db_name,
  host     = host, 
  user     = user, 
  password = password
)

db$available_databases
#> [1] "test_db"                   "information_schema"       
#> [3] "mysql"                     "performance_schema"       
#> [5] "previous_close_prices_db"  "sys"                      
#> [7] "example_db"

db$connected_database
#> [1] "information_schema"

db$tables
#>  [1] "ADMINISTRABLE_ROLE_AUTHORIZATIONS"    
#>  [2] "APPLICABLE_ROLES"                     
#>  [3] "CHARACTER_SETS"                       
#>  [4] "CHECK_CONSTRAINTS"                    
#>  [5] "COLLATIONS"                           
#>  [6] "COLLATION_CHARACTER_SET_APPLICABILITY"
#>  [7] "COLUMNS"                              
#>  [8] "COLUMNS_EXTENSIONS"                   
#>  [9] "COLUMN_PRIVILEGES"                    
#> [10] "COLUMN_STATISTICS"                    
#> [11] "ENABLED_ROLES"                        
#> [12] "ENGINES"                              
#> [13] "EVENTS"                               
#> [14] "FILES"                                

# You can also get the pool object to run queries etc.
pool <- db$pool

DBI::dbListTables(pool)
#>  [1] "ADMINISTRABLE_ROLE_AUTHORIZATIONS"    
#>  [2] "APPLICABLE_ROLES"                     
#>  [3] "CHARACTER_SETS"                       
#>  [4] "CHECK_CONSTRAINTS"                    
#>  [5] "COLLATIONS"                           
#>  [6] "COLLATION_CHARACTER_SET_APPLICABILITY"

db$close()
```

Similarly, we can connect to **PostgreSQL** with.

``` r
library(dbmanager)

db <- PostgreSQL$new(
  db_name  = db_name,
  host     = host, 
  user     = user, 
  password = password
)

db$available_databases
db$connected_database
db$tables
pool <- db$pool

db$close()
```

## Issues & Contributions

If you encounter a clear bug, please file an issue with a minimal
reproducible example on
[GitHub](https://github.com/eokodie/dbmanager/issues).

Contributions to the package are welcome. Please start by filing an
[issue](https://github.com/eokodie/dbmanager/issues), outlining the bug
you intend to fix or functionality you intend to add or modify.

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](.github/CODE_OF_CONDUCT.md). By participating in this project
you agree to abide by its terms.
