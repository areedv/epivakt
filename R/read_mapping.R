#' Read name value mappings from file
#'
#' When using mappings obtained from WHONET input files will be named
#' "CodeDict_" with some further reference to content such as antibiotic,
#' organism or specimen.
#'
#' @param file Path and name of file containing the mapping
#' @param type What to map, one of
#'   \code{c("antibiotic", "specimen", "organism")}
#' @param source Where does the mapping come from. Currently the only valid
#'   option is \code{"analytix"}
#'
#' @returns A data frame containing the _value_ that the corresponding _name_
#'   found in the data should be mapped
#' @export
#'
#' @examples
read_mapping <- function(file, type, source = "analytix") {

  stopifnot(type %in% c("antibiotic", "specimen", "organism"))

  fun_name <- paste0("read_", type, "_map")
  do.call(fun_name, list(file = file, source = source))
}

read_antibiotic_map <- function(file, source = "analytix") {

  d <- read.csv2(file, header = FALSE, sep = "", skip = 1)

  if (source == "analytix") {
    return(data.frame(name = d$V2, value = d$V1))
  } else {
    stop(paste0("Unknown source '", source, "'."))
  }
}

read_specimen_map <- function(file, source = "analytix") {

  d <- read.csv2(file, header = FALSE, sep = "", skip = 1)

  if (source == "analytix") {
    return(data.frame(name = d$V3, value = d$V4))
  } else {
    stop(paste0("Unknown source '", source, "'."))
  }
}

read_organism_map <- function(file, source = "analytix") {

  d <- read.csv2(file, header = FALSE, sep = "", skip = 1)

  if (source == "analytix") {
    return(data.frame(name = d$V2, value = d$V1))
  } else {
    stop(paste0("unknown source '", source, "'."))
  }
}
