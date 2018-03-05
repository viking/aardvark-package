\name{installed_packages}
\alias{installed_packages}
\title{
  List packages that have been installed into a local Aardvark directory
}
\description{
  Use this function to list packages that have been installed into a local
  Aardvark directory.
}
\usage{
  installed_packages(package_name = NULL, lib = file.path(Sys.getenv("HOME"), ".aardvark"))
}
\arguments{
  \item{package_name}{
    Limit return value to versions of specified package name
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
  \dontrun{installed_packages()}
}
\keyword{ utilities }
