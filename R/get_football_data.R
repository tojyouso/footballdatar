#' Get season data for one league
#'
#' Retrieve season level data from \url{http://www.football-data.co.uk} in a tidy format.
#' The data is downloaded on a competition-season level
#'
#' @param season The year (as a number) that the required season began.
#' For example for the 2018/2019 season, use \code{2018}
#' @param league_name The code (as a string) for the required league. At the moment only \code{"E0"}
#' for the English Premier League is supported
#' @param clean Boolean. \code{TRUE} will clean the dataframe
#' @examples \dontrun{
#' get_football_data(season = 2017, league = "E0")
#' }

get_football_data <- function(season = 2017, league_name = "E0",
                              clean = TRUE) {

  # build the url for the required data and download as csv
  df <- read.csv(paste0("http://www.football-data.co.uk/mmz4281/",
                 substr(season, 3, 4),
                 substr(season + 1, 3, 4),
                 "/",
                 league_name,
                 ".csv"),
           stringsAsFactors = FALSE) %>%
    dplyr::mutate(season = season,
                  league = league_name)

  return(tibble::as_tibble(df))
}
