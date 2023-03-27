
function [a, fa, iter] = newton(f, df, x0, tol, itmax)
  % INPUT:
  %   f     => funzione di cui cercare le radici
  %   df    => derviata prima della funzione f
  %   x0    => punto da cui far partire il metodo
  %   tol   => sulla soluzione trovata
  %   itmax => numero massimo di iterazioni disposti a fare
  % OUTPUT:
  %   a     => approssimazione trovata
  %   fa    => la funzione f valutata in a
  %   iter  => numero iterazioni effettuate per arrivare ad a
  a = x0;
  fa = f(a);
  dfa = df(a);
  delta = tol+1;
  iter = 0;
  while iter < itmax && abs(delta) > tol
    iter = iter+1;
    delta = fa/dfa;
    a = a-delta;
    fa = f(a);
    dfa = df(a);
  end
end

