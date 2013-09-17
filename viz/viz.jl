using Gadfly
using RunningStats
using DataFrames

srand(1)
s = StreamStats()
N = 10_000
x = cumsum(randn(N))
ms = zeros(N)
trs = zeros(N)
tr = 0.0
a = 0.001
for i in 1:N
	update!(s, x[i])
	tr = (1 - a) * tr + a * x[i]
	trs[i] = tr
	ms[i] = mean(s)
end

set_default_plot_size(10inch, 6inch)
df = DataFrame(x = [1:N, 1:N, 1:N],
	           y = [x, ms, trs],
	           group = repeat(["Ground Truth", "Stationary Running Mean", "Smoothed Running Mean"], inner = [N]))
plot(df, x = "x", y = "y", color = "group", Geom.line)
