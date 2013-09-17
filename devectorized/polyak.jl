# Fit Polyak-Ruppert averaging
function polyak(X::Matrix,
	            y::Vector,
	            η::Real = 0.001,
	            max_itr::Integer = 1_000)
	p, n = size(X)
	b = zeros(p)
	c = zeros(p)
	gr = zeros(p)
	itr = 0
	while itr < max_itr
		itr += 1
		polyak_pass!(X, y, b, η, gr)
		c[:] = ((itr - 1) / itr) * c + (1 / itr) * b
	end
	return c
end

function polyak_pass!(X::Matrix,
	                  y::Vector,
	                  b::Vector,
	                  η::Real,
	                  gr::Vector)
	p, n = size(X)
	j = rand(1:n)
	h = dot(X[:, j], b)
	r = (y[j] - h)
	for i in 1:p
		gr[i] = r * X[i, j]
		b[i] += η * gr[i]
	end
	return
end
