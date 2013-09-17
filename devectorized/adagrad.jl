# AdaGrad SGD
function adagrad(X::Matrix,
	             y::Vector,
	             η::Real = 0.001,
	             max_itr::Integer = 1_000,
	             τ0::Integer = 0)
	p, n = size(X)
	b = zeros(p)
	gr = zeros(p)
	s = zeros(p)
	itr = 0
	while itr < max_itr
		itr += 1
		adagrad_pass!(X, y, b, η, gr, s, τ0)
	end
	return b
end

function adagrad_pass!(X::Matrix,
	                   y::Vector,
	                   b::Vector,
	                   η::Real,
	                   gr::Vector,
	                   s::Vector,
	                   τ0::Integer)
	p, n = size(X)
	j = rand(1:n)
	h = dot(X[:, j], b)
	r = (y[j] - h)
	for i in 1:p
		gr[i] = r * X[i, j]
		s[i] += gr[i]^2
		b[i] += η * gr[i] / (τ0 + sqrt(s[i]))
	end
	return
end
