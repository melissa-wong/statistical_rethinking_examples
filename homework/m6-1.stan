//
// Simple binary logistic model for HW problem 6 part 1a

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  int<lower=0> Ngender;
  int gender[N];
  int awards[N];
  int applications[N];
}

// The parameters accepted by the model. 
parameters {
  real alpha[Ngender];
}

// The model to be estimated. 
model {
  // Likelihood
  //target += binomial_logit_lpmf(awards | applications, alpha[gender]);
  awards ~ binomial_logit(applications, alpha[gender]);
  
  // Prior
  //target += normal_lpdf(alpha[gender] | 0, 1);
  alpha[gender] ~ normal(0, 1);
}

generated quantities {
  // Posterior Predictive
  int awards_pred[N];
  awards_pred = binomial_rng(applications,
    inv_logit(alpha[gender]));
}
