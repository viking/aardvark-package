use_package <- function(package_name, package_version = NULL,
    lib = file.path(Sys.getenv("HOME"), ".aardvark"))
{
  if (missing(package_name)) {
    stop('argument "package_name" is missing, with no default')
  }
  package_name <- as.character(substitute(package_name))
  packages <- installed_packages(package_name)
  if (is.null(package_version)) {
    packages$nver <- numeric_version(packages$version)
    index <- order(packages$nver, decreasing = TRUE)[1]
    package <- packages[index, , drop = TRUE]
  } else {
    package <- subset(packages, version == package_version, drop = TRUE)
  }

  if (!is.list(package)) {
    stop("Package ", package_name, " (version ", package_version, ") not found")
  }
  library(package_name, lib.loc = package$path, character.only = TRUE)
}
