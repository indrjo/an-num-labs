
function [c, fc, iter] = bisezione(f, a, b, tol, itmax)
  % INPUT:
  %   f     => funzione di cui cercare le radici
  %   a, b  => estremi delll'intervallo di ricerca
  %   tol   => sulla soluzione trovata
  %   itmax => numero massimo di iterazioni
  % OUTPUT:
  %   c     => approssimazione trovata
  %   fc    => la funzione f valutata in c
  %   iter  => numero iterazioni effettuate
  iter = 0;
  while abs(a-b) > tol && iter < itmax
    % nel caso in cui uno dei due estremi è
    % uno zero, ci fermiamo direttamente.
    if f(a) == 0
      c = a; return;
    elseif f(b) == 0
      c = b; return;
    else
      % altrimenti bisogna suddividere l'intervallo
      % in due intervalli di uguale lunghezza
      c = (a+b)/2;
      if f(a)*f(c) < 0
        b = c;
      else
        a = c;
      end
    end
  iter = iter+1;
  end
  fc = f(c);
end

