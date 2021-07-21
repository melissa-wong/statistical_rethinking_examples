library("rstan")
N <- 5
y <- c(10, 10, 12, 11, 9)


fit_integrated <- stan("rounding_integrated.stan",  iter=1e5, chains=4)
print(fit_integrated)

fit_latent <- stan("rounding_latent.stan",  iter=1e5, chains=4)
print(fit_latent)

fit_latent_2 <- stan("rounding_latent_2.stan",  init=function() list(mu=rnorm(1), sigma=exp(rnorm(1)), z=y), iter=1e5, chains=4)
print(fit_latent_2)
