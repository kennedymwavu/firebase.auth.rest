#' Get the base url for Firebase Auth
#'
#' @param endpoint The endpoint of a request.
#' Valid values:
#' - "identitytoolkit" (default)
#' - "securetoken"
#' @return String. Base url.
#' @examples
#' get_base_url()
#' get_base_url(endpoint = "securetoken")
#'
#' @keywords internal
#' @noRd
get_base_url <- function(endpoint = c("identitytoolkit", "securetoken")) {
  endpoint <- match.arg(arg = endpoint)

  switch(
    EXPR = endpoint,
    identitytoolkit = "https://identitytoolkit.googleapis.com",
    securetoken = "https://securetoken.googleapis.com",
    "https://identitytoolkit.googleapis.com"
  )
}
