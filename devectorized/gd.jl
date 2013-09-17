# Gradient descent
function gd(X::Matrix,
	        y::Vector,
	        η::Real = 0.001,
	        max_itr::Integer = 1_000)
	p, n = size(X)
	b = zeros(p)
	gr = zeros(p)
	se, se_old = Inf, Inf
	itr = 0
	while !(abs(se - se_old) < 10e-6) && itr < max_itr
		itr += 1
		se_old = se
		se = gd_pass!(X, y, b, η, gr)
	end
	return b
end

function gd_pass!(X::Matrix,
	              y::Vector,
	              b::Vector,
	              η::Real,
	              gr::Vector)
	p, n = size(X)
	se = 0.0
	fill!(gr, 0.0)
	for j in 1:n
		h = dot(X[:, j], b)
		r = (y[j] - h)
		se += r^2
		for i in 1:p
			gr[i] += r * X[i, j]
		end
	end
	for i in 1:p
		b[i] += η * gr[i]
	end
	return se
end
