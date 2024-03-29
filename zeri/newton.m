function [a, fa, iter] = newton(f, df, a, tol, itmax)
  % INPUT:
  %   f     : funzione di cui cercare le radici
  %   df    : derivata prima della funzione f
  %   a     : punto da cui far partire il metodo
  %   tol   : sulla soluzione trovata
  %   itmax : numero massimo di iterazioni disposti
  %            a fare per l'approssimazione
  % OUTPUT:
  %   a     : approssimazione trovata
  %   fa    : la funzione f valutata in a
  %   iter  : numero massimo di iterazioni disposti
  %           a fare per arrivare ad a
  iter = 0;
  delta = tol+1; % per innescare il loop
  while iter < itmax && abs(delta) > tol
    iter = iter+1;
    delta = f(a)/df(a);
    a = a-delta;
  end
  fa = f(a);
end
