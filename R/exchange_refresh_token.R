#' Exchange a refresh token for an ID token
#'
#' Refreshes a Firebase ID token
#' @param refresh_token String. A Firebase Auth refresh token.
#' @return A named list with the following items:
#' - `expires_in`: The number of seconds in which the ID token expires.
#' - `token_type`: The type of the refresh token, always "Bearer".
#' - `refresh_token`: The Firebase Auth refresh token provided, or a new
#'    refresh token.
#' - `id_token`: A Firebase Auth ID token.
#' - `user_id`: The uid corresponding to the provided ID token.
#' - `project_id`: Your Firebase project ID.
#' - `error`:
#'    - `NULL` if no error code in response
#'    - A list of 2 if response was an error:
#'      - `code`: Error code
#'      - `message`: Error message
#' @details
#' Visit [Firebase Auth REST API docs](https://firebase.google.com/docs/reference/rest/auth#section-refresh-token)
#' for more details
#' @examples
#' if (FALSE) {
#' # first sign in user and get the 'refresh_token':
#' user <- sign_in(email = "user@gmail.com", password = "password")
#' refresh_token <- user$refreshToken
#'
#' # exchange the refresh token:
#' response <- exchange_refresh_token(refresh_token = refresh_token)
#' response
#' }
#' @export
exchange_refresh_token <- \(refresh_token) {
  url_path <- "/v1/token"
  data <- list(refresh_token = refresh_token, grant_type = "refresh_token")
  base_url <- base_url(endpoint = "securetoken")
  perform_req(url_path = url_path, data = data, base_url = base_url)
}
