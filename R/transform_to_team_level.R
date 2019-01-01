#' Transform clean data from match to team level data
#'
#' Retrieve season level data from \url{http://www.football-data.co.uk} in a tidy format.
#' The data is downloaded on a competition-season level
#'
#' @param .data A result from a \code{clean_football_data}
#'
#' @export
#' @examples \dontrun{
#' transform_to_team_level()
#' }

transform_to_team_level <- function(.data) {

  .data %>%
  purrr::pmap_dfr(
           function(home_team, away_team, fthg, ftag, date,
                    hs, as, hst, ast, ...) {
             tibble::data_frame(
               date = c(date, date),
               team = c(home_team, away_team),
               opponent = c(away_team, home_team),
               home = c(1, 0),
               goals_scored = c(fthg, ftag),
               goals_conceded = c(ftag, fthg),
               shots_taken = c(hs, as),
               shots_conceded = c(as, hs),
               sot_taken = c(hst, ast),
               sot_conceded = c(ast, hst)

             )
           }) %>%
    dplyr::mutate(date = lubridate::as_date(date),
           points = 3 * (goals_scored > goals_conceded) + 1 * (goals_scored == goals_conceded))
}
