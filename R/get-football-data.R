#' Get season data for one league
#'
#' Retrieve season level data from \code{football-data.co.uk} in a tidy format.
#' The data is downloaded on a competition-season level
#'
#' @param season The year (as a number) that the required season began.
#' For example for the 2018/2019 season, use \code{2018}
#' @param league The code (as a string) for the required league. At the moment only \code{"E0"}
#' for the English Premier League is supported
#'
#' @examples \dontrun{
#' get_football_data(season = 2017, league = "E0")
#' }

get_football_data <- function(season = 2017, league = "E0") {

  read_csv(str_c("http://www.football-data.co.uk/mmz4281/",
                 str_sub(season, 3, 4),
                 str_sub(season + 1, 3, 4),
                 "/",
                 league,
                 ".csv")) %>%
    mutate(season = season)
}
