.onLoad <- function(libname,pkgname){
  setConn()
}

.onUnload <- function(libname,pkgname){
  destroyConn()
}
