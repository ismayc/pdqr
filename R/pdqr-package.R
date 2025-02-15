# Package description -----------------------------------------------------
#' pdqr: Work with Custom Distribution Functions
#'
#' @details Excerpt of important documentation:
#' - README and vignettes provide overview of package functionality.
#' - Documentation of [meta_*()][meta_all()] functions describes implementation
#' details of pdqr-functions.
#'     - Documentation of [print()][methods-print] and [plot()][methods-plot]
#' methods describes how you can interactively explore properties of
#' pdqr-functions.
#' - Documentation of [new_*()][new_p()] functions describes the process of
#' creating pdqr-functions.
#' - Documentation of [as_*()][as_p()] functions describes the process of
#' updating class of pdqr-functions.
#' - Documentation of `form_*()` functions describes how different
#' transformation functions work. Important pages are for [form_trans()] and
#' [Pdqr methods for S3 group generic functions][methods-group-generic].
#' - Documentation of `summ_*()` functions describes how different summary
#' functions work. A good place to start is [summ_center()].
#' - Documentation of [`region_*()`][region] functions describes functionality
#' to work with regions: data frames defining subset of one dimensional real
#' line.
#'
"_PACKAGE"


# Methods for pretty printing ---------------------------------------------
# Methods for pretty printing of pdqr-functions as string. Usually used for
# printing them as elements of list-columns in data frame or tibble (tidyverse
# package).
# Only methods for "pdqr" class are implemented (instead of four more quick
# methods for every class separately) because of possible collision with classes
# "p", "d", "q", "r" from some other package. This implmementation has not very
# big overhead (around 4 microseconds).

#nocov start
# Function `pillar::type_sum()` is used in 'tibble' package. This method is
# registered in `.onLoad()` to avoid explicit import of 'pillar'.
type_sum.pdqr <- function(x) {
  paste0(meta_class(x), "-fun")
}

# This enables printing the `data.frame(l = I(list(new_d(1, "discrete"))))`
#' @export
toString.pdqr <- function(x, ...) {
  paste0(meta_class(x), "-function")
}
#nocov end


# Other methods -----------------------------------------------------------
#nocov start
#' @export
summary.pdqr <- function(object, ...) {
  print(object)
}
#nocov end
