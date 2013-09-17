include("data/generate.jl")
include("devectorized/adagrad.jl")

norm(adagrad(X1, y1, 1.0, 100_000) - β1)
norm(adagrad(X1, y1, 0.1, 100_000) - β1)
norm(adagrad(X1, y1, 0.01, 100_000) - β1)

norm(adagrad(X2, y2, 1.0, 100_000) - β2)
norm(adagrad(X2, y2, 0.1, 100_000) - β2)
norm(adagrad(X2, y2, 0.01, 100_000) - β2)

norm(adagrad(X3, y3, 1.0, 100_000) - β3)
norm(adagrad(X3, y3, 0.1, 100_000) - β3)
norm(adagrad(X3, y3, 0.01, 100_000) - β3)
