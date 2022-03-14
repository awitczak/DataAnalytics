data {
    int<lower=1> N; // n of years
}

parameters {
    real y[N]; // probabilistic variables y
    real theta; // probabilistic variable theta
}

model {
    // conditional probability density for the ys
    // given theta
    y ~ normal(theta, 1);
    // prior probability density for theta
    theta ~ normal(0, 1);
}