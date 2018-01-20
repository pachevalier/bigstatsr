/******************************************************************************/

#include <RcppArmadillo.h>
#include <bigstatsr/SubMatCovAcc.h>
#include <bigstatsr/biglasso/linear.hpp>

using namespace Rcpp;

/******************************************************************************/

#define CALL_COPY_CDFIT_GAUSSIAN_HSR(ACC) {                                    \
  return bigstatsr::biglassoLin::COPY_cdfit_gaussian_hsr(                      \
    ACC, y, lambda, center, scale, resid, alpha, eps, max_iter, dfmax);  \
}

// Dispatch function for COPY_cdfit_gaussian_hsr
// [[Rcpp::export]]
List COPY_cdfit_gaussian_hsr(Environment BM,
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
                             int dfmax) {

  DISPATCH_SUBMATCOVACC(CALL_COPY_CDFIT_GAUSSIAN_HSR)
}

/******************************************************************************/
