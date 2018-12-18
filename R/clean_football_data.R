#' Make football data ready for R coding
#'
#' Takes data downloaded from \url{http://www.football-data.co.uk} using
#'  \code{\link[footballdatar]{get_football_data}} and cleans it
#' by turning all column names into snake case and formatting the date columns.
#' Pipe ready
#'
#' @param .data The data that needs to be cleaned.

#' @examples \dontrun{
#' clean_football_data(.data = get_football_data())
#' }

clean_football_data <- function(.data) {

  # build the url for the required data and download as csv
  .data %>%
      janitor::clean_names(case = "snake") %>%
      dplyr::mutate(date = lubridate::dm(date)) %>%
    dplyr::select(league, season, date, everything(), - div)

}
