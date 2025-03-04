% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/category.R
\name{categorize}
\alias{categorize}
\title{Apply categories to data based on mapping}
\usage{
categorize(data, mapping)
}
\arguments{
\item{data}{Vector of names (from data) that is to be mapped into categorized
values.}

\item{mapping}{Data frame with columns \code{name} and \code{value} as provided by
\code{read_mappin()}}
}
\value{
A vector of the same length as \code{data}. Names in \code{data} with no
matching values from \code{mapping} will return NA
}
\description{
Used to provide known categories to whatever found in raw data. Matching is
based on output from \code{read_mapping()}.
}
\examples{
data <- sample(c("gerA", "geA", "gerB", "germC"), 10, replace = TRUE)
mapping <- data.frame(
  name = c("gerA", "geA", "gerB"),
  value = c("GermA", "GermA", "GermB")
)

# data and corresponding category
data.frame(data = data, category = categorize(data, mapping))
}
