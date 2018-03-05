installed_packages <- function(package_name = NULL,
    lib = file.path(Sys.getenv("HOME"), ".aardvark"))
{
  lib <- normalizePath(lib, mustWork = TRUE)
  if (!is.null(package_name)) {
    dirname <- file.path(lib, package_name)
  } else {
    dirname <- lib
  }
  files <- list.files(dirname, pattern = "DESCRIPTION", recursive = TRUE,
                      full.names = TRUE)
  files <- substring(files, nchar(lib) + 2)

  rows <- lapply(strsplit(files, .Platform$file.sep), function(parts) {
    name <- parts[1]
    version <- parts[2]
    row <- c(name, version, file.path(lib, name, version))
    names(row) <- c("name", "version", "path")
    return(row)
  })
  as.data.frame(do.call(rbind, rows), stringsAsFactors = FALSE)
}
