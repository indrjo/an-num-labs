function [c] = minquad_sgs(n, x, y)
  % !!! Qui, x e y sono vettori *colonna* di R^m
  A = vandermonde(n, x);
  % Dobbiamo risolvere il problema A'*Ac = A'y in c.
  [Q R] = sgs(A);
  c = solve_upper_triangular(R, Q'*y);
end

