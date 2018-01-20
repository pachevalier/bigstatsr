/******************************************************************************/

#include <RcppArmadillo.h>
#include <bigstatsr/SubMatCovAcc.h>
#include <bigstatsr/biglasso/logistic.hpp>

using namespace Rcpp;

/******************************************************************************/

#define CALL_COPY_CDFIT_BINOMIAL_HSR(ACC) {                                    \
  return bigstatsr::biglassoLog::COPY_cdfit_binomial_hsr(                      \
    ACC, y, lambda, center, scale, resid, alpha, eps, max_iter, dfmax, warn);  \
}

// Dispatch function for COPY_cdfit_binomial_hsr
// [[Rcpp::export]]
List COPY_cdfit_binomial_hsr(Environment BM,
                             const NumericVector& y,
                             const IntegerVector& row_idx,
                             const IntegerVector& col_idx,
                             const NumericMatrix& covar,
                             const NumericVector& lambda,
                             const NumericVector& center,
                             const NumericVector& scale,
                             NumericVector& resid,
                             double alpha,
                             double eps,
                             int max_iter,
                             int dfmax,
                             bool warn) {

  DISPATCH_SUBMATCOVACC(CALL_COPY_CDFIT_BINOMIAL_HSR)
}

/******************************************************************************/
