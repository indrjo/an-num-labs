
format long;
f = @(x) exp(x)-x.^2-sin(x)-1;
df = @(x) exp(x)-2*x-cos(x);
fplot(f, [-2,2]); grid on;
[c, fc, iter] = newton(f, df, 2, 1e-12, 100)

