#include <Rcpp.h>
using namespace Rcpp;

// [[Rcpp::export]]
NumericVector logmoments(NumericVector x) {
  if (is_true(any(x <= 0))) {
    stop("All input values must be positive for log");
  }
  
  int n = x.size();
  NumericVector logx = log(x); 
  
  double m2 = 0.0, m3 = 0.0;
  
  for(int i=0; i<n; i++) {
    m2 += pow(logx[i], 2);
    m3 += pow(logx[i], 3);
  }
  
  m2 /= n;
  m3 /= n;
  
  return NumericVector::create(
    _["kappa2"] = m2,
    _["kappa3"] = m3
  );
}
