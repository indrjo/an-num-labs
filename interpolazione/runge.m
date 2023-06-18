
% Controesempio di Runge
f = @(x) 1./(1+x.^2);

% Scegliamo "tanti" nodi per il grafico della funzione sopra
xx = -5:1e-3:5;
% Le valutazioni di f nei nodi di sopra.
yy = f(xx);

% Calcolaimo i polinomi interpolatori su nodi equispaziati e calcolare le 
% distanze tra f e i polinomi interpolatori.
figure(1);
plot(xx, yy, "linewidth", 2);
hold on;
for n = 2:2:12
  x = linspace(-5, 5, n+1);
  y = f(x);
  p = polyfit(x, y, n);
  py = polyval(p, xx);
  plot(xx, py, strcat(";polinomio di grado ", num2str(n), ";"));
  E(n/2) = norm(py-yy, "inf");
end
hold off;
print runge1.png

%%%

figure(2);
semilogy(E, "linewidth", 2);
print runge2.png
