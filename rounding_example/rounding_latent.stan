data{
  int<lower=0> N;
  vector[N] y;
}
parameters {
  real mu;
  real<lower=0> sigma;
  vector<lower=-0.5,upper=0.5>[N] error;
}
transformed parameters {
  vector[N] z;
  z <- y - error;
}
model {
  z ~ normal(mu, sigma);
}
