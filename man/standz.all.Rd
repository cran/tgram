\name{standz.all}
\alias{standz.all}
\alias{standz}
\alias{plot.standz.all}

\title{
Vaganov normalized tracheidogram
}
\description{
The function produces a normalized tracheidogram, i.e. a curve showing variations in cell parameters as a function of the cell position within an annual ring, following the procedure of Vaganov (1990) 
}
\usage{
standz.all(traq, series, wl = NULL, w.char = NULL, order = NULL, G = 30)
standz(tgl1, G=30)

\method{plot}{standz.all}(x, which=NULL,...)
}
\arguments{
  \item{traq}{
 A vector with the ordered sequences of measurements for each tracheidogram.
}
  \item{series}{
A vector of indicator values (i.e. a factor) with each level indicating each unique tracheidogram.
}
  \item{wl}{
A vector indicating if the measurement is wall or lumen.
}
  \item{w.char}{
Character used in \code{wl} to indicate "wall".
}
  \item{order}{
Vector indicating the ordering of each measurement in each lumen or wall series within a tracheidogram.
}
  \item{G}{
Number of cells to get the original measurements normalized to.
}
  \item{tgl1}{
Vector with the ordered sequences of measurements of a single tracheidogram.
}

  \item{x}{
An object of class \code{standz.all} resulting from applying the standz.all function.
}

  \item{which}{
One of NULL, "w", or any other character. This produces the plot function to draw all the tracheidograms together, only the "wall" traqueidograms or only the "lumen" ones, respectively.
}

  \item{\dots}{
Additional graphical parameters passed to \code{link{plot}}.
}

}


\value{
\code{standz} returns a vector of length \emph{G} with the normalized values. 
\code{standz.all} returns an object of class \code{standz.all}. Basically a list with the following elements:

\item{data.stdz}{A matrix with \emph{G} columns and as many rows as unique wall and lumen tracheidograms were in the original data, each with the normalized values of each tracheidogram.}
\item{which.w }{Vector indicating which rows in \code{data.stdz} are "wall" tracheidograms. }
\item{which.l }{Vector indicating which rows in \code{data.stdz} are "lumen" tracheidograms. }

}



\references{
Vaganov, E.A. 1990. The tracheidogram method in tree-ring analysis and its application.  In: Cook E.R., Kairiukstis L.A., eds.  \emph{ Methods of dendrochronology: applications in the environmental sciences } . Kluwer Academic Publishers. Dordrecht, the Netherlands. pp. 63-76.


}
\author{
Marcelino de la Cruz \email{marcelino.delacruz@upm.es} and Lucia DeSoto
}


\examples{
\dontrun{
data(juniperus)

cosa <- with(juniperus,
                  standz.all(traq=width.um, series=traqueidogram,
                                wl=lumen.wall, w.char="w", G=20)
                  )

plot(cosa, type="l")
plot(cosa, type="l", which="w")
plot(cosa, type="l", which="l", add=T)

standz(with(juniperus,width.um[traqueidogram==1 & lumen.wall =="l"]), G=20)

lines(1:20,
      standz(with(juniperus,width.um[traqueidogram==1 & lumen.wall =="l"]), G=20),
      lwd=3)
}
}

\keyword{ smooth }
\keyword{ manip }
