\name{install_package}
\alias{install_package}
\title{
  Install a package from the Aardvark repository
}
\description{
  Use this function to install a package from the Aardvark repository.
}
\usage{
install_package(package_name, package_version = NULL,
                lib = file.path(Sys.getenv("HOME"), ".aardvark"),
                repos = "http://localhost:4678")
}
\arguments{
  \item{package_name}{
    Name of the package to install
  }
  \item{package_version}{
    Version of the package to install, or NULL for the latest version
  }
  \item{lib}{
    Installation directory
  }
  \item{repos}{
    URL of the Aardvark repository server
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
  \dontrun{install_package("shiny")}
}
\keyword{ utilities }
