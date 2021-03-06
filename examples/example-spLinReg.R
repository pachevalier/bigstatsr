set.seed(1)

# simulating some data
N <- 230
M <- 730
X <- FBM(N, M, init = rnorm(N * M, sd = 5), type = "integer")
y <- X[, 1:5] + rnorm(N)
covar <- matrix(rnorm(N * 3), N)

ind.train <- sort(sample(nrow(X), 150))
ind.test <- setdiff(rows_along(X), ind.train)

test <- big_spLinReg(X, y[ind.train], ind.train = ind.train,
                     covar.train = covar[ind.train, ],
                     warn = FALSE)
# K = 10 predictions
str(preds <- predict(test, X, ind.row = ind.test, covar.row = covar[ind.test, ]))
# Combine them
preds2 <- rowMeans(preds)

plot(preds2, y[ind.test], pch = 20); abline(0, 1, col = "red")
