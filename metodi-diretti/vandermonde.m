function [A] = vandermonde(n, x)
  % !!! Qui x è un vettore *colonna* di R^m
  for i = 0:n
    A(:,i+1) = x.^i;
  end
end
