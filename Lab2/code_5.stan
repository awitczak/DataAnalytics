parameters {
real<lower=0> theta; // constrained dec of theta
}

model {
    theta ~ gamma(1.25,1.25); // gamma density valid only for + values of theta
}