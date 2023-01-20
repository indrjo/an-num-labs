function [c] = minquad(n, x, y)
  % !!! Qui, x e y sono vettori *colonna* di R^m
  A = vandermonde(n, x');
  % Dobbiamo risolvere il problema A'*Ac = A'y in c.
  % Qui, lo facciamo con l'operatore \ di Matlab.
  c = (A'*A)\(A'*y);
end

