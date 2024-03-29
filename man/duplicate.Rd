\name{duplicate}
\alias{duplicate}
\title{
  Duplicate function
}
\description{
  This is the man page for the duplicate function. 
}
\usage{
  duplicate( x, n=2 )
}
\arguments{
  \item{x}{ The object to be duplicated. }
  \item{n}{ The number required. }
}
\details{
  \code{duplicate} returns \code{n} of object \code{x} in a vector.
}
\author{
  Tim Yates
}
\examples{
  duplicate( 4 )     # Returns c( 4, 4 )
  duplicate( 'tim' ) # Returns c( 'tim', 'tim' )
}
