\name{traq.profile}
\alias{traq.profile}
\docType{data}
\title{
Light intensity throughout a microscopic section of Juniperus thurifera wood 
}
\description{
A measurement of light intensity troughout a sequence of pixels in a microscopic section of \emph{Juniperus thurifera} wood.
}
\usage{data(traq.profile)}
\format{
  A data frame with 883 observations on the following 2 variables.
  \describe{
    \item{\code{X1}}{Pixel position in the sequence}
    \item{\code{Y1}}{Light intensity}
  }
}


\examples{
data(traq.profile)
tgram(traq.profile, mw=10)

}
\keyword{datasets}
