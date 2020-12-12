#' Manage SQL Server connections
#' 
#' @description 
#' This is a class for managing SQL Server connections.
#' 
#' @inheritParams DatabaseManager
#' 
#' @examples 
#' \dontrun{
#' library(dbmanager)
#' sql_server <- SQLServer$new(db_name, server_url, username, password, port)
#' sql_server$available_databases
#' sql_server$connected_database
#' sql_server$tables
#' sql_server$close()
#' } 
#' 
#' @importFrom rlang abort
#' @export
SQLServer <- R6::R6Class(
  classname = "SQLServer", 
  inherit = DatabaseManagerR6,
  
  public = list(
    #' @description
    #' open a SQLServer connection
    #' @param db_name Database name.
    #' @param server_url Server URL.
    #' @param user User name.
    #' @param password Password.
    #' @param port Port number
    #' @return A new `Pool` object.
    open = function(db_name, server_url, username, password, port) {
      tryCatch({
        pool::dbPool(
          odbc::odbc(),
          driver   = "SQL Server",
          server   = server_url,
          database = db_name,
          uid      = username,
          pwd      = password,
          port     = port
        )},
        error = function(e) abort("Failed to establish a database connection.")
      )
    }
  )
)