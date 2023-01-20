function [d] = lu_det2(A)
  n = rows(A); U = A;
  delta = 0;
  for i = 1:n
    m = 0; k = i;
    for j = i:n
      if abs(A(j,i)) > m
        k = j; m = abs(A(j,i));
      end
    end
    U([i k],:) = U([k i],:);
    if i != k
      delta = delta+1;
    end
    for j = i+1:n
      m = U(j,i)/U(i,i);
      U(j,:) = U(j,:)-m*U(i,:);
    end
  end
  % A questo punto U è una matrice triangolare: il suo
  % determinante è dato dal prodotto delle entrate
  % della diagonale principale.
  det_U = U(1,1);
  if n >= 2
    for i = 2:n
      det_U = det_U * U(i,i);
    end
  end
  d = (-1)^delta*det_U;
end
