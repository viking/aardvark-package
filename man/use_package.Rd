\name{use_package}
\alias{use_package}
\title{
  Attach package to the current search path
}
\description{
  Use this function to attach a package that has been installed into a local
  Aardvark directory. This function wraps the base `library` function.
}
\usage{
  use_package(package_name, package_version = NULL,
              lib = file.path(Sys.getenv("HOME"), ".aardvark"))
}
\arguments{
  \item{package_name}{
    Name of package to attach
  }
  \item{package_version}{
    Version of package to attach, or NULL to use latest installed version
  }
  \item{lib}{
    Path of the local Aardvark installation directory
  }
}
\details{
}
\value{
}
\references{
}
\author{
  Jeremy Stephens
}
\note{
}

\seealso{
}
\examples{
  \dontrun{use_package(shiny)}
}
\keyword{ utilities }
