function [L U P] = lu_piv(A)
  n = rows(A);
  L = eye(n);
  U = A;
  P = eye(n);
  for i = 1:n
    % Ricerca del primo j per cui |A(j,i)| è massimo
    m = 0; k = i;
    for j = i:n
      if abs(A(j,i)) > m
        k = j; m = abs(A(j,i));
      end
    end
    L([i k],1:i-1) = L([k i],1:i-1);
    U([i k],:) = U([k i],:);
    P([i k],:) = P([k i],:);
    % Da qui in poi si procede come in lu_nopiv.
    for j = i+1:n
      % Fatta la pivotazione, si può proseguire come
      % sopra.
      L(j,i) = U(j,i)/U(i,i);
      % Le righe successive all'i-esima sono ottenute
      % sottraendo un opportuno multiplo dell'i-esima.
      U(j,:) = U(j,:)-L(j,i)*U(i,:);
    end
  end
end

