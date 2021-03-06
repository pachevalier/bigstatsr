#include "../inst/include/bigstatsr.h"

// [[Rcpp::depends(bigmemory, BH, RcppArmadillo)]]
#include <RcppArmadillo.h> // Sys.setenv("PKG_LIBS" = "-llapack")
#include <bigmemory/MatrixAccessor.hpp>
using namespace Rcpp;

/******************************************************************************/

inline arma::vec y_XBXty(const arma::mat& X, const arma::mat& B, const arma::vec& y) {
  return y - X * (B * (X.t() * y));
}

/******************************************************************************/

template <typename T>
List univRegLin3(MatrixAccessor<T> macc,
                 const arma::mat& covar,
                 const arma::vec& y,
                 const IntegerVector& rowInd) {
  int n = rowInd.size();
  int m = macc.ncol();
  int K = covar.n_cols;
  arma::vec tmp, eps;
  arma::vec v(n);
  arma::mat B = inv(covar.t() * covar);
  arma::vec y2 = y_XBXty(covar, B, y);
  double d, beta;
  int i, j;

  // indices begin at 1 in R and 0 in C++
  IntegerVector trains = rowInd - 1;

  NumericVector res(m);
  NumericVector var(m);

  for (j = 0; j < m; j++) {
    for (i = 0; i < n; i++) {
      v(i) = macc[j][trains[i]];
    }
    tmp = y_XBXty(covar, B, v);
    d = 1 / dot(v, tmp);
    beta = d * dot(v, y2);
    eps = y2 - beta * tmp;
    res[j] = beta;
    var[j] = d * dot(eps, eps) / (n - K - 1);
  }

  return(List::create(_["estim"] = res,
                      _["std.err"] = sqrt(var)));
}

/******************************************************************************/

// Dispatch function for univRegLin3
// [[Rcpp::export]]
List univRegLin3(XPtr<BigMatrix> xpMat,
                 const arma::mat& covar,
                 const arma::vec& y,
                 const IntegerVector& rowInd) {

  switch(xpMat->matrix_type()) {
  case 1:
    return univRegLin3(MatrixAccessor<char>(*xpMat),   covar, y, rowInd);
  case 2:
    return univRegLin3(MatrixAccessor<short>(*xpMat),  covar, y, rowInd);
  case 4:
    return univRegLin3(MatrixAccessor<int>(*xpMat),    covar, y, rowInd);
  case 6:
    return univRegLin3(MatrixAccessor<float>(*xpMat),  covar, y, rowInd);
  case 8:
    return univRegLin3(MatrixAccessor<double>(*xpMat), covar, y, rowInd);
  default:
    throw Rcpp::exception(ERROR_TYPE);
  }
}

/******************************************************************************/
