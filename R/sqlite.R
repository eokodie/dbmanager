#' Manage SQLite connections
#' 
#' @description 
#' This is a class for managing SQLite connections.
#' 
#' @inheritParams DatabaseManager
#' 
#' @examples 
#' \dontrun{
#' library(dbmanager)
#' db <- SQLite$new(host = ":memory:")
#' db$connected_database
#' db$tables
#' db$close()
#' } 
#' 
#' @importFrom rlang abort
#' @export
SQLite <- R6::R6Class(
  classname = "SQLite", 
  inherit = DatabaseManager,
  
  public = list(
    pool = NULL,
    connected_database = NULL,
    tables = NULL,
    
    initialize = function(host){
      self$pool                <- self$open(host)
      self$tables              <- DBI::dbListTables(self$pool)
      self$connected_database  <- host
    },
    
    #' @description
    #' open a MonetDBLite connection
    #' @param host DB host
    open = function(host = ":memory:") {
      tryCatch({
        pool::dbPool(
          drv   = MonetDBLite::MonetDBLite(),
          host= host
        )},
        error = function(e) abort("Failed to establish a database connection.")
      )
    }
  )
)