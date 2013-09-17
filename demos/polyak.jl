include("data/generate.jl")
include("devectorized/polyak.jl")

norm(polyak(X1, y1, 0.01, 10_000) - β1)
norm(polyak(X1, y1, 0.001, 10_000) - β1)
norm(polyak(X1, y1, 0.0001, 10_000) - β1)

norm(polyak(X2, y2, 0.01, 10_000) - β2)
norm(polyak(X2, y2, 0.001, 10_000) - β2)
norm(polyak(X2, y2, 0.0001, 10_000) - β2)

norm(polyak(X3, y3, 0.01, 10_000) - β3)
norm(polyak(X3, y3, 0.001, 10_000) - β3)
norm(polyak(X3, y3, 0.0001, 10_000) - β3)
