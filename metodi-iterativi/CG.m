function [x, rs, iter] = CG(A, b, x0, maxit, tol)
  iter = 1;
  x = x0;
  r = b-A*x;
  p = r;
  res0 = norm(b-A*x);
  res_rel = tol+1; % per innescare il loop che segue...
  rs(iter) = res_rel;
  while iter < maxit && res_rel > tol
    iter = iter+1;
    Ap = A*p;    % su questo passo può servire un po' tempo...
    pAp = p'*Ap; % su questo passo può servire un po' tempo...
    alpha = p'*r/pAp;
    x = x+alpha*p;
    r = r-alpha*Ap;
    res_rel = norm(r)/res0;
    rs(iter) = res_rel;
    beta = Ap'*r/pAp;
    p = r-beta*p;
  end
end
