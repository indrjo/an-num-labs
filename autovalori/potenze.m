
function [q lambda qs lambdas] = potenze(A, q0, maxiter, tol)
  % A è un matrice quadrata nxn, q0 è un vettore di R^n
  % (Si potrebbe scegliere q0 =/= 0 qualsiasi, senza
  % lasciare all'utente possibilità di scelta. Ad esempio,
  % q0 = [1 0 0]'...)
  k = 1;
  q = q0;
  res = tol+1; % si fa questa assegnazione giusto
               % per innescare il loop che seque
  while res >= tol
    z = A*q;
    q = z/norm(z);       qs(:,k) = q;
    lambda = conj(q)'*z; lambdas(k) = lambda;
    res = norm(A*q-lambda*q);
    if k >= maxiter
      disp("potenze:failed");
      return;
    end
    k = k+1;
  end
end

