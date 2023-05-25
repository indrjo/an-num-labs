format long;

f = @(x) (x-1)*log(x);
df = @(x) log(x) + (x-1)/x;
a = 1.5;

tol = 1e-6;
itmax = 100;

fplot(f, [-2,2]); grid on;

[errs1] = modnewton2(f, df, a, 1, tol, itmax);

[errs2] = modnewton2(f, df, a, 2, tol, itmax);

semilogy(errs1, "red", "LineWidth", 2);
hold on;
semilogy(errs2, "blue", "LineWidth", 2);
hold off;

title(["[rosso] m=1, " "[blu] m=2"]);

xlabel("n");
ylabel("|x_{n+1}-x_n|");

print esercizio1.png
