data {
    int<lower=1> N; // N of observations
    int<lower=1> M; // N of observations
    matrix[N, M] X; // Covariate design matrix
    real sigma; // prior std deviation
}

transformed data {
    vector[N] ones_N = rep_vector(1, N);
    vector[M] ones_M = rep_vector(1, M);
}

// simulate empirical probabilities from the current value of the parameters
generated quantities {
    vector[N] prob_ppc;
    real beta[M] = normal_rng(0, ones_M * sigma); // prior model
    real alpha = normal_rng(0, sigma); // prior model
    prob_ppc = inv_logit(X * to_vector(beta) + ones_N * alpha);
}