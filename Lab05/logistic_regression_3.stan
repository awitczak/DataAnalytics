data {
    int<lower=1> N; // N of observations
    int<lower=1> M; // N of observations
    matrix[N, M] X; // Covariate design matrix
    int<lower=0, upper=1> y[N]; // binary variates
}

transformed data {
    vector[N] ones_N = rep_vector(1, N);
}

parameters {
    vector[M] beta; // slopes
    real alpha; // intercept
}

model {
    beta ~ normal(0, 0.25); // prior model
    alpha ~ normal(0, 0.25); // prior model
    y ~ bernoulli_logit(X * beta + alpha); // observational model
}

// simulate empirical probabilities from the current value of the parameters
generated quantities {
   int y_ppc[N] = bernoulli_logit_rng(X * beta + ones_N * alpha);
   vector[N] prob_ppc = inv_logit(X * beta + ones_N * alpha);
}