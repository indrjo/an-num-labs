function [x, r, iter] = jacobi(A, b, x0, maxiter, tol)
  n = rows(A);
  P = zeros(n);
  for i = 1:n
        P(i,i) = A(i,i);
  end
  [x, r, iter] = splitting(A, P, b, x0, maxiter, tol);
end

