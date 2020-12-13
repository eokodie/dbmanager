#' Manage MonetDBLite connections
#' 
#' @description 
#' This is a class for managing MonetDBLite connections.
#' 
#' @inheritParams DatabaseManager
#' 
#' @examples 
#' \dontrun{
#' library(dbmanager)
#' monetdb <- MonetDBLite$new(tempdir())
#' monetdb$connected_database
#' monetdb$tables
#' monetdb$close()
#' } 
#' 
#' @importFrom rlang abort
#' @export
MonetDBLite <- R6::R6Class(
  classname = "MonetDBLite", 
  inherit = DatabaseManager,
  
  public = list(
    pool = NULL,
    connected_database = NULL,
    tables = NULL,
    
    initialize = function(db_dir){
      self$pool                <- self$open(db_dir)
      self$tables              <- DBI::dbListTables(self$pool)
      self$connected_database  <- db_dir
    },
    
    #' @description
    #' open a MonetDBLite connection
    #' @param db_dir DB directory.
    open = function(db_dir) {
      tryCatch({
        pool::dbPool(
          drv   = MonetDBLite::MonetDBLite(),
          db_dir= db_dir
        )},
        error = function(e) abort("Failed to establish a database connection.")
      )
    }
  )
)