//
// Predictions for simple binary logistic model for HW problem 6 part 1a

// The input data is a vector 'y' of length 'N'.
data {
  int<lower=0> N;
  int<lower=0> Ngender;
  int<lower=0> Nsamples;
  int gender[N];
  int applications[N];
  real alpha[Nsamples, Ngender];
}

// The parameters accepted by the model. 
parameters {
}

// The model to be estimated. 
model {
}

generated quantities{
  int awards_pred[Nsamples, N];
  // Per Sec 16.3 more efficient to index arrays in row-major order
  for (j in 1:Nsamples) {
    for (i in 1:N) {
      awards_pred[j, i] = binomial_rng(applications[i],
    inv_logit(alpha[j, gender[i]]));
    }
  }
}
