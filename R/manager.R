#' Manage Databases
#' 
#' @description 
#' This is a superclass for managing database connections.
#' 
#' @section Methods:
#' \describe{
#'   \item{\code{open}}{open a database connection}
#'   \item{\code{close}}{close database connection}
#'   \item{\code{show_databases}}{show available databases}
#'   \item{\code{create_new_db}}{create a new database}
#'   \item{\code{create_table}}{create a table}
#'   \item{\code{query}}{run SQL query}
#' }
#' @return A DatabaseManager template.
DatabaseManager <- R6::R6Class(
  classname  = "DatabaseManager",
  cloneable  = FALSE,
  lock_class = TRUE,
  
  public = list(
    pool                = NULL,
    connected_database  = NULL,
    available_databases = NULL,
    tables              = NULL,
    
    #' Create a new `DatabaseManager` object.
    #' @param db_name Database name.
    #' @param host Host name.
    #' @param user User name.
    #' @param password Password.
    #' @return A new `DatabaseManager` object.
    initialize = function(db_name, host, user, password){
      pool                     <- self$open(db_name, host, user, password)
      self$pool                <- pool
      self$tables              <- DBI::dbListTables(pool)
      self$connected_database  <- db_name
      self$available_databases <- self$show_databases(pool)
    },
    
    #' open a database connection
    open = function(db_name, host, user, password) {},
    
    # close database connection
    close = function() {
      message("Closing connection...")
      pool::poolClose(self$pool)
    },
    
    # show available databases
    show_databases = function(pool) {
      DBI::dbGetQuery(pool, "show databases")$Database
    },
    # create a new database
    create_new_db = function(src, db_name){
      query <- glue::glue("create databases {db_name}")
      DBI::dbGetQuery(src, query)
      # DBI::dbGetQuery(pool, "set global local_infile=true;")
    },
    
    #' @description Send query, retrieve results and then clear result set.
    #' @param statement a character string containing SQL..
    query = function(statement){
      DBI::dbGetQuery(self$pool, statement)
    },
    #' @description Create a table
    #' @param name A character string specifying the unquoted DBMS table name.
    #' @param value a data.frame (or coercible to data.frame).
    create_table = function(name, value){
      DBI::dbWriteTable(self$pool, name, value)
      self$tables <- DBI::dbListTables(self$pool)
    }, 
    
    finalize = function() {
      self$close()
    }
  )
)

