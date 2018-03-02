install_package <- function(package_name, package_version = NULL,
    lib = file.path(Sys.getenv("HOME"), ".aardvark"),
    repos = "http://localhost:4678")
{
  packages <- list_packages(package_name, package_version, simplify = FALSE)
  if (length(packages) == 0) {
    if (!is.null(package_version)) {
      package_version <- "latest"
    }
    stop("Could not find package ", package_name, " (version ", package_version, ")")
  }

  # get latest version
  latest_package <- NULL
  latest_version <- NULL
  for (package in packages) {
    version <- numeric_version(package$version)
    if (is.null(latest_version) || version > latest_version) {
      latest_package <- package
      latest_version <- version
    }
  }
  package <- latest_package
  package_version <- package$version

  destdir <- file.path(lib, package_name, package_version)
  dir.create(destdir, recursive = TRUE)
  install.packages(package$url, destdir, dependencies = FALSE)
}
