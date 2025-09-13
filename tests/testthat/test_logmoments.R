library(logMoments)
library(testthat)

# Data for testing
x <- c(1, 2, 70, 3, 4)

# Creating logmoments object
object <- logmoments_obj(x)

# Check class of object
stopifnot(inherits(object, "logmoments"))

# Check names in object
stopifnot(all(names(object) %in% c("data", "kappa2", "kappa3")))

# Check that values are correct 
stopifnot(abs(object$kappa2 - mean(log(x)^2)) < 1e-8)
stopifnot(abs(object$kappa3 - mean(log(x)^3)) < 1e-8)

# Check that negative values are caught 
bad_input <- c(1, 2, -3, 4)

expect_error(logmoments_obj(bad_input), "All input values must be positive for log")


# Print output 
print(object)
