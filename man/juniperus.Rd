\name{juniperus}
\alias{juniperus}
\docType{data}
\title{
Traqueid measurements in Juniperus thurifera
}
\description{
An example of traqueid measurements to standarize with function tgram
}
\usage{data(juniperus)}
\format{
  A data frame with 77 observations on the following 4 variables.
  \describe{
    \item{\code{traqueidogram}}{Numeric vector indicating the traqueidogram to which each measurement belongs}
    \item{\code{lumen.wall}}{A factor indicating if the measurement is lumen (\code{l})or wall (\code{w})}
    \item{\code{order}}{Position of the measurement in the ordered sequence within each traqueidogram}
    \item{\code{width.um}}{Width (micrometres) of each measurement}
  }
}


\examples{
data(juniperus)
cosa <- with(juniperus, standz.all(traq=width.um, series=traqueidogram, wl=lumen.wall, w.char="w", G=20))
plot(cosa, type="l")

}
\keyword{datasets}
