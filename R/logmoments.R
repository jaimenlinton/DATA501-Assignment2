#' Create a logmoments object
#'
#' @param x Numeric vector of positive values
#' @return An object of class "logmoments"
#' @examples
#' lc <- logmoments_obj(c(1,2,3,4))
#' print(lc)
#' @useDynLib logMoments, .registration = TRUE
#' @importFrom Rcpp sourceCpp
#' @export
logmoments_obj <- function(x) {
  vals <- logmoments(x)
  structure(
    list(
      data = x,
      kappa2 = vals[["kappa2"]],
      kappa3 = vals[["kappa3"]]
    ),
    class = "logmoments"
  )
}

#' Print method for logmoments objects
#' @param x An object of class "logmoments"
#' @export
print.logmoments <- function(x, ...) {
  cat("Log moments object:\n")
  cat("Data length:", length(x$data), "\n")
  cat("κ2 =", x$kappa2, "\n")
  cat("κ3 =", x$kappa3, "\n")
}


