\name{tgram}
\alias{tgram}
\alias{plot.tgram}

\title{
Compute Tracheidograms
}
\description{
Function to compute tracheidograms from microscopic measurements.
}
\usage{
tgram(traq, val50 = 50, xlim = NULL, ylim = NULL, mw = 1, plotit = TRUE)

\method{plot}{tgram}(x, xlim = NULL, ylim = NULL, colores = c("red", "green"),
      leyenda = c("lumen", "double wall"), lwd = 2,
      add = FALSE,traq.0 = TRUE, bg.legend = NULL, ...)
}
\arguments{
  \item{traq}{
microscopic light profile. A vector with the light measurements or a \code{data.frame} or \code{matrix} with two columns. In this case, the first column contains pixel order (i.e. position along the x axis) and the second one contains the light (i.e. "y") lectures.
}
  \item{val50}{
"y-value" at wich measurements should be made.
}
 \item{mw}{
integer. Width of the rolling window to smooth the original data.
}
 \item{plotit}{
logical. should the original data and the computed tracheidogram be drawn?
}
\item{xlim}{
extent of the x-axis. A vector of length 2. 
}
  \item{ylim}{
extent of the y-axis. A vector of length 2. 
}
  
\item{x}{
an object of class tgram, resulting from \code{tgram} function.
}
  
\item{colores}{
a vector of length 2, with the colors to draw the lumen and wall measurements, respectively. 
}
  \item{leyenda}{
a vector of length 2 with the legend to appear in the plot. By default leyenda =c("lumen","double wall").
}
  \item{lwd}{
width of the lines in the legend. 
}
  \item{add}{
logical. If TRUE, add to a current plot.
}
  \item{traq.0}{
logical. If TRUE, draw the original measurements.
}
  \item{bg.legend}{
background color for the legend.
}
  \item{\dots}{
additional graphical parameters.
}



}
\details{
The purpouse of this fucntion is obtaining cell anatomical data from microscopic light measurements (see DeSoto et al. for details of data adquisition). The microscopic lectures are first smoothed with a rolling window (using function \code{\link[zoo]{rollmean}} of package \code{zoo}, using the selected width \code{mw}. Then, the smoothed curve is "cut" at the  treshold value \code{val50} and the distances among the intersection points are computed. This provides an ordered sequence of  lumen diameters (LD) and double wall thikness (DWT) measurements. From this sequence some other anatomical measurements are computed. Radial cell wall thickness is computed as \emph{ CWT[t] = 1/2 * (DWT[t]/2 + DWT[t+1]/2) }. Tracheid diameter is computed as \emph{ TD[t] = DWT[t]/2 + LD[t] + DWT[t+1]/2}.
}
\value{
tgram returns an object of class \emph{tgram}, bassically a list with 

\item{traq }{original data.}
\item{traq0 }{if \code{traq} was a 2 column matrix, then \code{traq0} returns the same object. If \code{traq} was a vector,  \code{traq0} returns a two column matrix (first column with pixel position and second with ligh lectures).}
\item{cut.points }{two column matrix with the coordinates of the intersection of \emph{y = val50} and the smoothed curve.}
\item{what }{vector indicating if the computed distances are of lumen (1) or double wall (2) .}
\item{distances }{ordered sequence of the computed distances (both of lumen and double wall).}
\item{LD }{ordered sequence of lumen diameters.}
\item{DWT }{ordered sequence of double wall thickness. }
\item{mw }{width of the rolling window employed to smooth the data.}
\item{CWT }{ordered sequence of radial cell wall thikness'.}
\item{TD }{ordered sequence of tracheid diameters.}
\item{LD_CWT_ratio }{ordered sequence of LD/CWT ratio.}


}
\references{
DeSoto, L., De la Cruz, M. & Fonti, P. 2011. Intra-annual pattern of tracheid size in the Mediterranean Juniperus thurifera as indicator for seasonal water stress. \emph{Canadian Journal of Forest Research}  41: 1280-1294.
}
\author{
Marcelino de la Cruz Rot and Lucia DeSoto
}

\examples{

data(traq.profile)

plot(tgram(traq.profile, mw=10),leyenda=c("lumen","double wall"),
        xlab="distance pixel", ylab="grey value",ylim=c(0,250),
        bg.legend="white")



}


\keyword{ smooth }
\keyword{ manip }
