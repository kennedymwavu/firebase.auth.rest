#' Delete account
#'
#' @param id_token The Firebase ID token of the user to delete.
#' @return A named list with the following items:
#' - `error`:
#'    - `NULL` if no error code in response
#'    - A list of 2 if response was an error:
#'      - `code`: Error code
#'      - `message`: Error message
#' @details
#' Visit [Firebase Auth REST API docs](https://firebase.google.com/docs/reference/rest/auth#section-delete-account)
#' for more details
#' @examples
#' if (FALSE) {
#' # first sign in user and get the 'id_token':
#' user <- sign_in(email = "user@gmail.com", password = "password")
#' id_token <- user$idToken
#'
#' # delete user account:
#' response <- delete_account(id_token = id_token)
#' response
#' }
#' @export
delete_account <- \(id_token) {
  url_path <- "/v1/accounts:delete"
  data <- list(idToken = id_token)
  perform_req(url_path = url_path, data = data)
}
