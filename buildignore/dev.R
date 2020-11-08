library(magrittr)
source("~/.Rprofile")
library(dbmanager)

path <- system.file("extdata/config.yml", package = "cashmachine")
conf <- config::get(file = path)

# Connect to database
mysql <- MySQL$new(
  db_name   = "test_db",
  host     = conf$db$host, 
  user     = conf$db$user, 
  password = conf$db$pwd
)

mysql$available_databases
mysql$connected_database
mysql$tables
mysql$close()



