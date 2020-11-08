#' mysql
#' 
#' @description 
#' This class is a class for managing MySQL connections.
#' 
#' @inheritParams DatabaseManager
#' 
#' @examples 
#' \dontrun{
#' library(dbmanager)
#' mysql <- MySQL$new(db_name, host, user, password)
#' mysql$available_databases
#' mysql$connected_database
#' mysql$tables
#' mysql$close()
#' } 
#' 
#' @export
MySQL <- R6::R6Class(
  classname = "MySQLManager", 
  inherit = DatabaseManager,
  
  public = list(
    #' @description
    #' open a MySQL connection
    #' @param db_name Database name.
    #' @param host Host name.
    #' @param user User name.
    #' @param password Password.
    #' @return A new `Pool` object.
    open = function(db_name, host, user, password) {
      
      pool <- tryCatch({
        pool <- pool::dbPool(
          drv      = RMySQL::MySQL(),
          dbname   = db_name,
          host     = host, 
          user     = user, 
          password = password
        )
        # Enable loading local data on the client & server sides
        DBI::dbGetQuery(pool, "set global local_infile=true;")
        pool
      },
      error = function(e) rlang::abort("Failed to establish a connection.")
      )
    }
  )
)
