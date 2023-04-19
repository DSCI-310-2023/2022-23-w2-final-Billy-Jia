#' recode_activ
#'
#' Determine the active value of the given variable
#' @param activ_value The active value given
#' @return the active state currently in
#'
#'
#' @examples
#' activ1 <- recode_activ(1);
#' activ2 <- recode_activ();
#' activ3 <- recode_activ("hello");
#' @export
recode_activ <- function(activ_value) {
  if (is.na(activ_value)) {
    return(NA_character_)
  } else if (activ_value == 1) {
    return("active")
  } else if (activ_value == 0) {
    return("inactive")
  } else {
    stop("Unknown activ value")
  }
}
