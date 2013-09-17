include("data/generate.jl")

norm(inv(X1 * X1') * (X1 * y1) - β1)

norm(inv(X2 * X2') * (X2 * y2) - β2)

norm(inv(X3 * X3') * (X3 * y3) - β3)
