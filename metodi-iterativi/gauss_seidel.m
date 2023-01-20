function [x, r, iter] = gauss_seidel(A, b, x0, maxiter, tol)
  % Scrviamo A = P-N, con P invertibile. In questo caso
  % scegliamo P la parte triangolare inferiore di A.
  P = tril(A);
  % Ora il metodo iterativo quindi è quello che segue.
  [x, r, iter] = splitting(A, P, b, x0, maxiter, tol);
end

