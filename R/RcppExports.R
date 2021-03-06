# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

auc_sorted <- function(x, y) {
    .Call(`_bigstatsr_auc_sorted`, x, y)
}

getXPtrFBM <- function(path, n, m, type) {
    .Call(`_bigstatsr_getXPtrFBM`, path, n, m, type)
}

COPY_cdfit_gaussian_hsr <- function(BM, y, row_idx, col_idx, covar, lambda, center, scale, resid, alpha, eps, max_iter, dfmax, warn, row_idx_val, covar_val, y_val, n_abort, nlam_min) {
    .Call(`_bigstatsr_COPY_cdfit_gaussian_hsr`, BM, y, row_idx, col_idx, covar, lambda, center, scale, resid, alpha, eps, max_iter, dfmax, warn, row_idx_val, covar_val, y_val, n_abort, nlam_min)
}

COPY_cdfit_binomial_hsr <- function(BM, y, row_idx, col_idx, covar, lambda, center, scale, resid, alpha, eps, max_iter, dfmax, warn, row_idx_val, covar_val, y_val, n_abort, nlam_min) {
    .Call(`_bigstatsr_COPY_cdfit_binomial_hsr`, BM, y, row_idx, col_idx, covar, lambda, center, scale, resid, alpha, eps, max_iter, dfmax, warn, row_idx_val, covar_val, y_val, n_abort, nlam_min)
}

bigsummaries <- function(BM, row_idx, col_idx, covar, y, which_set, K) {
    .Call(`_bigstatsr_bigsummaries`, BM, row_idx, col_idx, covar, y, which_set, K)
}

bigcolvars <- function(BM, rowInd, colInd) {
    .Call(`_bigstatsr_bigcolvars`, BM, rowInd, colInd)
}

mycount1 <- function(BM, rowInd, colInd, codeInd) {
    .Call(`_bigstatsr_mycount1`, BM, rowInd, colInd, codeInd)
}

mycount2 <- function(BM, rowInd, colInd, codeInd) {
    .Call(`_bigstatsr_mycount2`, BM, rowInd, colInd, codeInd)
}

createFile <- function(fileName, nrow, ncol, type) {
    invisible(.Call(`_bigstatsr_createFile`, fileName, nrow, ncol, type))
}

decodeMat <- function(source, code) {
    .Call(`_bigstatsr_decodeMat`, source, code)
}

decodeVec <- function(source, code) {
    .Call(`_bigstatsr_decodeVec`, source, code)
}

GET_ERROR_TYPE <- function() {
    .Call(`_bigstatsr_GET_ERROR_TYPE`)
}

GET_ERROR_DIM <- function() {
    .Call(`_bigstatsr_GET_ERROR_DIM`)
}

GET_ERROR_BOUNDS <- function() {
    .Call(`_bigstatsr_GET_ERROR_BOUNDS`)
}

GET_ERROR_USHORT <- function() {
    .Call(`_bigstatsr_GET_ERROR_USHORT`)
}

extractVec <- function(xpbm, elemInd) {
    .Call(`_bigstatsr_extractVec`, xpbm, elemInd)
}

extractMat <- function(xpbm, rowInd, colInd) {
    .Call(`_bigstatsr_extractMat`, xpbm, rowInd, colInd)
}

pMatVec4 <- function(BM, x, rowInd, colInd) {
    .Call(`_bigstatsr_pMatVec4`, BM, x, rowInd, colInd)
}

cpMatVec4 <- function(BM, x, rowInd, colInd) {
    .Call(`_bigstatsr_cpMatVec4`, BM, x, rowInd, colInd)
}

replaceVecOne <- function(xpbm, elemInd, val) {
    invisible(.Call(`_bigstatsr_replaceVecOne`, xpbm, elemInd, val))
}

replaceVec <- function(xpbm, elemInd, vec) {
    invisible(.Call(`_bigstatsr_replaceVec`, xpbm, elemInd, vec))
}

replaceMatOne <- function(xpbm, rowInd, colInd, val) {
    invisible(.Call(`_bigstatsr_replaceMatOne`, xpbm, rowInd, colInd, val))
}

replaceMat <- function(xpbm, rowInd, colInd, mat) {
    invisible(.Call(`_bigstatsr_replaceMat`, xpbm, rowInd, colInd, mat))
}

transpose3 <- function(BM, BM2) {
    invisible(.Call(`_bigstatsr_transpose3`, BM, BM2))
}

univLinReg5 <- function(BM, covar_U, y, rowInd, colInd) {
    .Call(`_bigstatsr_univLinReg5`, BM, covar_U, y, rowInd, colInd)
}

IRLS <- function(BM, covar, y, z0, w0, rowInd, colInd, tol, maxiter) {
    .Call(`_bigstatsr_IRLS`, BM, covar, y, z0, w0, rowInd, colInd, tol, maxiter)
}

scaling <- function(source, mean, sd) {
    .Call(`_bigstatsr_scaling`, source, mean, sd)
}

complete2 <- function(BM) {
    invisible(.Call(`_bigstatsr_complete2`, BM))
}

incrSup2 <- function(BM, source) {
    invisible(.Call(`_bigstatsr_incrSup2`, BM, source))
}

scaleK <- function(BM, sums, mu, delta, nrow) {
    invisible(.Call(`_bigstatsr_scaleK`, BM, sums, mu, delta, nrow))
}

