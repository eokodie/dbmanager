#' Manage PostgreSQL connections
#' 
#' @description 
#' This is a class for managing PostgreSQL connections.
#' 
#' @inheritParams DatabaseManager
#' 
#' @examples 
#' \dontrun{
#' library(dbmanager)
#' postgres <- PostgreSQL$new(db_name, host, user, password)
#' postgres$available_databases
#' postgres$connected_database
#' postgres$tables
#' postgres$close()
#' } 
#' 
#' @importFrom rlang abort
#' @export
PostgreSQL <- R6::R6Class(
  classname = "PostgreSQL", 
  inherit = DatabaseManagerR6,
  
  public = list(
    
    #' @description
    #' open a PostgreSQL connection
    #' @param db_name Database name.
    #' @param host Host name.
    #' @param user User name.
    #' @param password Password.
    #' @return A new `Pool` object.
    open = function(db_name, host, user, password) {
      tryCatch({
        pool::dbPool(
          drv      = RPostgres::Postgres(),
          dbname   = db_name,
          host     = host, 
          user     = user, 
          password = password
        )},
        error = function(e) abort("Failed to establish a database connection.")
      )
    }
  )
)