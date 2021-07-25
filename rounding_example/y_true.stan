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
  // Likelihood
  y ~ normal(x * beta + alpha, sigma);
  // Priors
  alpha ~ normal(0, 1);
  beta ~ normal(0, 1);
  sigma ~ exponential(1);
}
