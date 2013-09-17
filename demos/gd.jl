include("data/generate.jl")
include("devectorized/gd.jl")

norm(gd(X1, y1, 0.01, 5_000) - β1)
norm(gd(X1, y1, 0.001, 5_000) - β1)
norm(gd(X1, y1, 0.0001, 5_000) - β1)

norm(gd(X2, y2, 0.0000001, 5_000) - β2)
norm(gd(X2, y2, 0.00000001, 5_000) - β2)
norm(gd(X2, y2, 0.000000001, 5_000) - β2)

norm(gd(X3, y3, 0.0000001, 5_000) - β3)
norm(gd(X3, y3, 0.00000001, 5_000) - β3)
norm(gd(X3, y3, 0.000000001, 5_000) - β3)
