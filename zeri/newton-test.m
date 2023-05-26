
format long;
f = @(x) exp(x)-x.^2-sin(x)-1;
df = @(x) exp(x)-2*x-cos(x);
[c, fc, iter] = newton(f, df, 2, 1e-6, 100)

