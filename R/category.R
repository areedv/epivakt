#' Apply categories to data based on mapping
#'
#' Used to provide known categories to whatever found in raw data. Matching is
#' based on output from `read_mapping()`.
#'
#' @param data Vector of names (from data) that is to be mapped into categorized
#'   values.
#' @param mapping Data frame with columns `name` and `value` as provided by
#'   `read_mappin()`
#'
#' @returns A vector of the same length as `data`. Names in `data` with no
#'   matching values from `mapping` will return NA
#' @export
#'
#' @examples
#' data <- sample(c("gerA", "geA", "gerB", "germC"), 10, replace = TRUE)
#' mapping <- data.frame(
#'   name = c("gerA", "geA", "gerB"),
#'   value = c("GermA", "GermA", "GermB")
#' )
#'
#' # data and corresponding category
#' data.frame(data = data, category = categorize(data, mapping))

categorize <- function(data, mapping) {

  map <- mapping$value
  names(map) <- mapping$name

  as.vector(
    map[match(data, names(map))]
  )
}


#' Print frequency of missing categories in data
#'
#' @param data Vector of raw, uncategorised data
#' @param category Vector of categorized values corresponding to `data` as
#'   returned by `categorize()`
#'
#' @returns A sorted frequency table of missing categories
#' @export
#'
#' @examples
#' data <- sample(c("gerA", "geA", "gerB", "germC", "gD"), 100, replace = TRUE)
#' mapping <- data.frame(
#'   name = c("gerA", "geA", "gerB"),
#'   value = c("GermA", "GermA", "GermB")
#' )
#'
#' # Corresponding categories
#' category <- categorize(data, mapping)
#'
#' # Occurrence of data with no matching category
#' missing_category(data, category)

missing_category <- function(data, category) {

  missing <- data[is.na(category)]

  sort(table(missing), decreasing = TRUE)

}
