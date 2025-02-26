#' Create an epivakt data set
#'
#' Function that creates an epivakt data set for further analysis. Input to this
#' function will be raw data from laboratory systems such as analytix.
#' Currently, this function only deal with the minimum set of variables and
#' it is likely to be extended.
#'
#' Any mapping of variables performed within this function will use
#' mapping defined in static data sets provided by the epivakt R package. Hence,
#' changes in mappings will be part of updates of the epivakt R package.
#'
#' @param id Vector containing relevant identification of records in the data.
#'   In analytix data this might be the TestId field
#' @param date Vector of strings containing dates. In analytix data dates are
#'   provided by the RequisitionDate field
#' @param location Vector containing references to locations. In analytix data
#'   the RequisitionCode field may be used as such
#' @param organism Vector containing references to bacteria found in samples. In
#'   analytix data this will correspond to the FindingResult field
#' @param date_format Character string defining the format for `date` and must
#'   correspond to whatever format provided by data. Default format is set to
#'   `"%Y.%m.%d"`
#'
#' @returns A data frame with epivakt data
#' @export
#'
#' @examples
#' # Make some data
#' id <- 1:10
#' date <- rep("2022.10.31", 10)
#' location <- LETTERS[1:10]
#' organism <- letters[19:28]
#'
#' # Make a data set
#' data.frame(epidata(id, date, location, organism))
epidata <- function(id, date, location, organism, date_format = "%Y.%m.%d") {
  date <- as.Date(date, format = date_format)
  organism <- epivakt::categorize(organism, epivakt::organism_map)

  data.frame(id, date, location, organism)
}
