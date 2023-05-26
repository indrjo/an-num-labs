format long;
f = @(x) exp(x)-x.^2-sin(x)-1;
fplot(f, [-2,2], "LineWidth", 2); grid on;
[c, fc, iter] = bisezione(f, 1, 1.5, 1e-12, 100)

print graph1.png
