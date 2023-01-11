function [L U] = lu_nopiv(A)
  % l'ordine della matrice quadrata A
  n = rows(A);
  % All'inizio, la matrice triangolare inferiore è
  % l'identità, ma di volta in volta verrà aggiornata.
  L = eye(n);
  % Facciamo una copia di A, la quale verrà modificata
  % passo dopo passo. In realtà, non ce ne sarebbe il
  % bisogno, in quanto basta alterare A direttamente.
  U = A;
  for i = 1:n
    for j = i+1:n
      % Questi sono i coefficienti ottenuti durante
      % il MEG. La cosa importante è che U(i, i) =/= 0.
      % La pivotazione evita ciò, ma in questa funzione
      % non la consideriamo.
      L(j,i) = U(j,i)/U(i,i);
      % Le righe successive all'i-esima sono ottenute
      % sottraendo un opportuno multiplo dell'i-esima.
      U(j,:) = U(j,:)-L(j,i)*U(i,:);
    end
  end
end

