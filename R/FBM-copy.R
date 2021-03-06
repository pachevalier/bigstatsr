################################################################################

#' Copy a Filebacked Big Matrix
#'
#' Copy a Filebacked Big Matrix with possible subsetting.
#'
#' @param X Could be any matrix-like object.
#' @inheritParams bigstatsr-package
#' @inheritParams FBM
#'
#' @return A copy of the [FBM][FBM-class].
#' @export
#'
#' @examples
#' X <- FBM(10, 10, init = 1:100)
#' X[]
#' X2 <- big_copy(X, ind.row = 1:5)
#' X2[]
#'
#' mat <- matrix(101:200, 10)
#' X3 <- big_copy(mat, type = "double")
#' X3[]
#'
#' X.code <- big_attachExtdata()
#' class(X.code)
#' X2.code <- big_copy(X.code)
#' class(X2.code)
#' all.equal(X.code[], X2.code[])
#'
big_copy <- function(X, ind.row = rows_along(X),
                     ind.col = cols_along(X),
                     type = typeof(X),
                     backingfile = tempfile(),
                     save = FALSE,
                     block.size = block_size(length(ind.row))) {

  if (inherits(X, "FBM.code256")) {
    args <- as.list(environment())
    args$X <- X$as.FBM()
    res <- do.call(big_copy, args)
    return(add_code256(res, code = X$code256, save = save))
  }

  res <- FBM(
    nrow = length(ind.row),
    ncol = length(ind.col),
    init = NULL,
    type = type,
    backingfile = backingfile,
    save = save
  )

  # Warn only once and don't check arguments
  warn_downcast(from = X, to = res)
  opt.save <- options(bigstatsr.typecast.warning = FALSE,
                      bigstatsr.check.args = FALSE)
  on.exit(options(opt.save), add = TRUE)

  # Don't write in parallel
  big_apply(X, a.FUN = function(X, ind, X2, ind.row, ind.col) {
    X2[, ind] <- X[ind.row, ind.col[ind]]
    NULL
  }, a.combine = 'c', ind = seq_along(ind.col), block.size = block.size,
  X2 = res, ind.row = ind.row, ind.col = ind.col)

  res
}

################################################################################
