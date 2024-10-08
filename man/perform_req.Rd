% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/perform_req.R
\name{perform_req}
\alias{perform_req}
\title{Perform a Firebase API request}
\usage{
perform_req(url_path, data, base_url = base_url())
}
\arguments{
\item{url_path}{String. The relative path to perform the request on.
Here are several valid ones:
\itemize{
\item "/v1/accounts:signUp"
\item "/v1/accounts:signInWithPassword"
\item "/v1/accounts:sendOobCode"
\item "/v1/accounts:sendOobCode"
\item "/v1/accounts:lookup"
\item "/v1/accounts:delete"
See \href{https://firebase.google.com/docs/reference/rest/auth#section-api-usage}{Firebase Auth REST API docs}
for all valid values
}}

\item{data}{A named list. Request body payload.}

\item{base_url}{Base url for the request. Defaults to \code{\link[=base_url]{base_url()}}.
Here are some valid ones:}
}
\value{
A named list. One of the list items is \code{error}. See Details.
}
\description{
This function provides a boilerplate for constructing an
\code{httr2::request()} to the Firebase API and performing the request.
}
\details{
\itemize{
\item \code{error}:
\itemize{
\item \code{NULL} if no error code in response
\item A list of 2 if response was an error:
\itemize{
\item \code{code}: Error code
\item \code{message}: Error message
}
}
}
}
