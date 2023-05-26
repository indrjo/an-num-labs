function [c, fc, iter] = bisezione(f, a, b, tol, itmax)
  % INPUT:
  %   f     : funzione di cui cercare le radici
  %   a, b  : estremi delll'intervallo di ricerca
  %   tol   : sulla soluzione trovata
  %   itmax : numero massimo di iterazioni disposti
  %           a compiere per approssimare uno zero
  % OUTPUT:
  %   c     : approssimazione trovata
  %   fc    : la funzione f valutata in c
  %   iter  : numero iterazioni effettuate
  iter = 0;
  while abs(a-b)/2 > tol && iter < itmax
    % Nel caso in cui uno dei due estremi è
    % uno zero, ci fermiamo direttamente.
    if f(a) == 0
      c = a; return;
    elseif f(b) == 0
      c = b; return;
    else
      % Altrimenti, suddividiamo l'intervallo [a, b]
      % in due intervalli di uguale lunghezza, [a, c]
      % e [c, b], dove c è il punto medio di [a, c], e
      % si seleziona quello che ha uno zero.
      c = (a+b)/2;
      if f(c) == 0
        return;
      else
        if f(a)*f(c) < 0
          b = c; % lo zero sta nell'intervallo [a, c]
        else
          a = c; % lo zero sta nell'intervallo [c, b]
        end
      end
    end
  iter = iter+1;
  end
  fc = f(c);
end
