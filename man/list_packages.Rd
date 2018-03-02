\name{list_package}
\alias{list_package}
\title{
  List packages available in the Aardvark repository
}
\description{
  Use this function to list packages that are available the Aardvark
  repository.
}
\usage{
  list_packages(name = NULL, version = NULL, simplify = TRUE, repos = "http://localhost:4678")
}
\arguments{
  \item{name}{
    Name of package or NULL
  }
  \item{version}{
    Version of package or NULL
  }
  \item{simplify}{
    If TRUE, return a data.frame of the results, otherwise return a list of lists
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
  \dontrun{list_packages()}
}
\keyword{ utilities }
