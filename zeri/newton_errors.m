function [errs] = newton_errors(f, df, a, m, tol, itmax)
  % INPUT:
  %   f     : funzione di cui cercare le radici
  %   df    : derivata prima della funzione f
  %   a     : punto da cui far partire il metodo
  %   m     : molteplicità della radice attesa
  %   tol   : sulla soluzione trovata
  %   itmax : numero massimo di iterazioni disposti
  %            a fare per l'approssimazione
  % OUTPUT:
  %   errs  : lista degli errori commessi da un passo
  %           al successivo
  iter = 0;
  delta = tol+1; % per innescare il loop
  while iter < itmax && abs(delta) > tol
    iter = iter+1;
    delta = m * f(a)/df(a);
    a = a-delta;
    errs(iter) = abs(delta);
  end
end
