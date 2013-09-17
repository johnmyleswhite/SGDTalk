srand(1)

using Distributions

# Isotropic
function easy(n::Integer, p::Integer)
	β = randn(p)
	μ = zeros(p)
	Σ = eye(p)
	X = rand(MultivariateNormal(μ, Σ), n)
	y = X'β + randn(n)
	return β, X, y
end

# Diagonal
function medium(n::Integer, p::Integer)
	β = randn(p)
	μ = zeros(p)
	Σ = zeros(p, p)
	for i in 1:p
		Σ[i, i] = i^5
	end
	X = rand(MultivariateNormal(μ, Σ), n)
	y = X'β + randn(n)
	return β, X, y
end

# Dense covariance
function hard(n::Integer, p::Integer)
	β = randn(p)
	μ = zeros(p)
	Σ = zeros(p, p)
	for i in 1:p
		Σ[i, i] = i^5
	end
	for j in 1:p
		for i in (j + 1):p
			Σ[i, j] = 0.9
			Σ[j, i] = 0.9
		end
	end
	X = rand(MultivariateNormal(μ, Σ), n)
	y = X'β + randn(n)
	return β, X, y
end

n, p = 1_000, 4
β1, X1, y1 = easy(n, p)
β2, X2, y2 = medium(n, p)
β3, X3, y3 = hard(n, p)
