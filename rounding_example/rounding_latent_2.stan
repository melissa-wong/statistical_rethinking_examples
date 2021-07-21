data{
  int<lower=0> N;
  vector[N] y;
}
parameters {
  real mu;
  real<lower=0> sigma;
  vector[N] z;
}
model {
  z ~ uniform(y - 0.5, y + 0.5);
  z ~ normal(mu, sigma);
}
