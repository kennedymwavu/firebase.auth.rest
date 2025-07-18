# firebase.auth.rest 1.0.1

- Fix: Update `firebase.auth.rest:::perform_req()` due to breaking changes in
  [{httr2} v1.2.0](https://www.tidyverse.org/blog/2025/07/httr2-1-2-0/#url-handling-improvements)
  regarding URL handling. The issue causing requests not to go through was
  mentioned [here](https://github.com/r-lib/httr2/issues/780).

# firebase.auth.rest 1.0.0

- Initial CRAN submission.
