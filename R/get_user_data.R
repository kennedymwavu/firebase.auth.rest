#' Get user data from firebase
#'
#' @param id_token String. The Firebase ID token of the account.
#' @return A named list with the following items:
#' - `users`: A list of length 1 which contains a nested named list with the
#'    following items:
#'    - `localId`: The uid of the current user.
#'    - `email`: The email of the account.
#'    - `emailVerified`: Whether or not the account's email has been verified.
#'    - `displayName`: The display name for the account.
#'    - `providerUserInfo`: Named list of provider objects which contain
#'        "providerId" and "federatedId".
#'    - `photoUrl`: The photo Url for the account.
#'    - `passwordHash`: Hash version of password.
#'    - `passwordUpdatedAt`: The timestamp, in milliseconds, that the account
#'        password was last changed.
#'    - `validSince`: The timestamp, in milliseconds, which marks a boundary,
#'        before which Firebase ID token are considered revoked.
#'    - `disabled`: Whether the account is disabled or not.
#'    - `lastLoginAt`: The timestamp, in milliseconds, that the account last
#'        logged in at.
#'    - `createdAt`: The timestamp, in milliseconds, that the account was
#'        created at.
#'    - `customAuth`: Whether the account is authenticated by the developer.
#' - `error`:
#'    - `NULL` if no error code in response
#'    - A list of 2 if response was an error:
#'      - `code`: Error code
#'      - `message`: Error message
#' @details
#' Visit [Firebase Auth REST API docs](https://firebase.google.com/docs/reference/rest/auth#section-get-account-info)
#' for more details
#' @examples
#' if (FALSE) {
#' user_data <- get_user_data("<id_token>")
#' lapply(user_data, `[[`, 1)
#' }
#' @export
get_user_data <- \(id_token) {
  url_path <- "/v1/accounts:lookup"
  data <- list(idToken = id_token)
  perform_req(url_path = url_path, data = data)
}
