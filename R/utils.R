#' Namespace Parent
#' @return The parent env of the package namespace, not locked after loading
nsp <- function(){
  rlang::env_parent(n=2)
}

#' Setup the pool connection
setConn <- function(){
    e <- nsp()

    e$connection_cache <- new.env(parent=emptyenv())

    e$connection_cache$poolConn <- pool::dbPool(drv=RSQLite::SQLite(),
                                                Server=":memory:")
}

#' Access the pool connection
#'
#' @return The live pool connection
getConn <- function(){
  e <- nsp()
  e$connection_cache$poolConn
}

#' Clean up the pool connection on unload
destroyConn <- function(){
    e <- nsp()

    pool::poolClose(getConn())
    e$connection_cache$poolConn <- NULL
    e$connection_cache <- NULL
    rm("connection_cache", envir=e)
}
