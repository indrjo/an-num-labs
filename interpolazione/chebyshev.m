
% Diamo una funzione che prende un numero intero positivo e restituisce un
% vettore contenente i nodi di Chebyshev.
chebyshev = @(n) (@(k) -5*cos(pi*k/n))(0:n);

f = @(x) 1./(1+x.^2);
% Anche in questo caso scegliamo un numero "alto" di nodi di Chebyshev e 
% valutiamo la funzione in questi punti.
xx = chebyshev(200);
yy = f(xx);

figure(1);
plot(xx, yy, "linewidth", 2);
hold on;
for n = 2:2:12
  x = chebyshev(n);
  y = f(x);
  p = polyfit(x, y, n);
  py = polyval(p, xx);
  plot(xx, py, strcat(";polinomio di grado ", num2str(n), ";"));
  E(n/2) = norm(py-yy, "inf");
end
hold off;
print chebyshev1.png

%%%

figure(2);
semilogy(E, "linewidth", 2);
print chebyshev2.png
