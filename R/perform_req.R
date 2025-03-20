#' Perform a Firebase API request
#'
#' This function provides a boilerplate for constructing an
#' `httr2::request()` to the Firebase API and performing the request.
#'
#' @param url_path String. The relative path to perform the request on.
#' Here are several valid ones:
#' - "/v1/accounts:signUp"
#' - "/v1/accounts:signInWithPassword"
#' - "/v1/accounts:sendOobCode"
#' - "/v1/accounts:sendOobCode"
#' - "/v1/accounts:lookup"
#' - "/v1/accounts:delete"
#' See [Firebase Auth REST API docs](https://firebase.google.com/docs/reference/rest/auth#section-api-usage)
#' for all valid values
#' @param data A named list. Request body payload.
#' @param base_url Base url for the request. Defaults to [get_base_url()].
#' Here are some valid ones:
#' @return A named list. One of the list items is `error`. See Details.
#' @details
#' - `error`:
#'    - `NULL` if no error code in response
#'    - A list of 2 if response was an error:
#'      - `code`: Error code
#'      - `message`: Error message
#' @keywords internal
#' @noRd
perform_req <- function(url_path, data, base_url = get_base_url()) {
  req <- httr2::req_body_json(
    req = httr2::req_url_query(
      .req = httr2::req_url_path(
        req = httr2::request(base_url = base_url),
        url_path
      ),
      key = api_key()
    ),
    data = data
  )

  tryCatch(
    expr = httr2::resp_body_json(
      resp = httr2::req_perform(req = req)
    ),
    error = error_handler
  )
}
