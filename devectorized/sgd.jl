# Stochastic gradient descent
function sgd(X::Matrix,
	         y::Vector,
	         η::Real = 0.001,
	         max_itr::Integer = 1_000)
	p, n = size(X)
	b = zeros(p)
	gr = zeros(p)
	itr = 0
	while itr < max_itr
		itr += 1
		sgd_pass!(X, y, b, η, gr)
	end
	return b
end

function sgd_pass!(X::Matrix,
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
