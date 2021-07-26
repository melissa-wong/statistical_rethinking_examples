data {
  int<lower=0> N;   // number of data items
  vector[N] x;      // predictor vector
  vector[N] y;      // outcome vector
}
parameters {
  real alpha;           // intercept
  real beta;            // coefficients for predictor
  real<lower=0> sigma;  // error scale
}
model {
  vector[N] mu;
  mu = x * beta + alpha;
  // Likelihood
  //print("log density before =", target());
  for(n in 1:N) {
    if(y[n] < 0.0) {
      target += log(Phi((y[n] - mu[n]) / sigma) 
          - Phi((y[n] - 1.0 - mu[n]) / sigma));     }
    else {
      target += log(Phi((y[n] + 1.0 - mu[n]) / sigma) 
          - Phi((y[n] - mu[n]) / sigma));    
    }
  }
  //print("log density after =", target());
  // Priors
  //alpha ~ normal(0, 1);
  target += normal_lpdf(alpha | 0, 1);
  //beta ~ normal(0, 1);
  target += normal_lpdf(beta | 0, 1);
  //sigma ~ exponential(1);
  target += exponential_lpdf(sigma | 1);
}
