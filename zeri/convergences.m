format long;

% Dati del problema.
f = @(x) (x-1)*log(x);
df = @(x) log(x) + (x-1)/x;
x0 = 1.5;
tol = 1e-6;
itmax = 100;

% Grafico della funzione.
fplot(f, [-2, 2], "LineWidth", 2);
grid on;
print graph2.png

% Collezione degli incrementi e relativi grafici.
[errs1] = newton_errors(f, df, x0, 1, tol, itmax);
[errs2] = newton_errors(f, df, x0, 2, tol, itmax);
semilogy(errs1, "red", "LineWidth", 2);
hold on;
semilogy(errs2, "blue", "LineWidth", 2);
hold off;
title(["[rosso] m=1, " "[blu] m=2"]);
xlabel("n");
ylabel("|x_{n+1}-x_n|");
print convergences.png
