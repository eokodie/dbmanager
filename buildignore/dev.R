library(magrittr)
source("~/.Rprofile")
library(dbmanager)

path <- system.file("extdata/config.yml", package = "pkg")
conf <- config::get(file = path)

# Connect to database
mysql <- dbmanager::MySQL$new(
  db_name   = "test_db",
  host     = conf$db$host, 
  user     = conf$db$user, 
  password = conf$db$pwd
)

mysql$available_databases
mysql$connected_database
mysql$tables
mysql$close()



# db_name <- Sys.getenv("host")
# host <- Sys.getenv("host")
# user <- Sys.getenv("host")
# pwd <- Sys.getenv("pwd")
# 
# mysql <- MySQL$new(
#   db_name   = db_name,
#   host     = host, 
#   user     = user, 
#   password = pwd
# )
# 
# mysql$available_databases
# mysql$connected_database
# mysql$tables
# mysql$close()