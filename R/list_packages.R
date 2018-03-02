list_packages <- function(name = NULL, version = NULL, simplify = TRUE,
                          repos = "http://localhost:4567")
{
  conditions <- list()
  if (!is.null(name)) conditions$name <- unbox(name)
  if (!is.null(version)) conditions$version <- unbox(version)
  data <- if (length(conditions) == 0) "{}" else toJSON(conditions)

  reader <- basicTextGatherer()
  header <- basicHeaderGatherer()
  result <- curlPerform(httpheader = c("Content-Type" = "application/json"),
                        postfields = data, url = paste0(repos, "/packages/search"),
                        post = 1L, writefunction = reader$update,
                        headerfunction = header$update)
  if (result != 0L || header$value()["status"] != "200") {
    print(header$value())
    print(reader$value())
    stop("There was a problem communicating with the server.")
  }
  data <- reader$value()
  result <- fromJSON(data, simplifyVector = FALSE)
  if (!simplify)
    return(result$packages)

  packages <- lapply(result$packages, function(package) {
    deps <- lapply(package$dependencies, function(dep) {
      if (!is.null(dep$operator) && !is.null(dep$version)) {
        paste0(dep$name, " (",  dep$operator, " ", dep$version, ")")
      } else {
        dep$name
      }
    })
    c(name = package$name, version = package$version,
      dependencies = paste(deps, collapse=", "))
  })
  as.data.frame(do.call(rbind, packages))
}
