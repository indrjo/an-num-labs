
function [q lambda qs lambdas] = potenze_inverse(A, mu, q0, maxiter, tol)
  % A è un matrice quadrata nxn, q0 è un vettore di R^n
  I = eye(size(A));
  iter = 1;
  q = q0/norm(q0);
  qs(:,iter) = q;
  res = tol+1; % si fa questa assegnazione
               % per innescare il loop sotto
  while res >= tol
    if iter > maxiter
      disp("potenze:failed");
      return;
    end
    iter = iter+1;
    z = (A-mu*I)\q;
    q = z/norm(z);
    qs(:,iter) = q;
    z = A*q;
    lambda = conj(q)'*z;
    lambdas(iter) = lambda;
    res = norm(z-lambda*q);
  end
end

