data{
  int<lower=0> N;
  vector[N] y;
}
parameters {
  real mu;
  real<lower=0> sigma;
}
model {
  for (n in 1:N)
    increment_log_prob(log(Phi((y[n] + 0.5 - mu) / sigma)
                         - Phi((y[n] - 0.5 - mu) / sigma)));
}
