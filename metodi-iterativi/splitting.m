function [x, rs, iter] = splitting(A, P, b, x0, maxiter, tol)
  %
  % A è una matrice quadrata n*n e P e N sono tali che A = P-N
  % e P è invertibile. Vogliamo risolvere l'equazione matriciale
  %
  %  A*x = b
  %
  % Il vettore x0 è quello da cui si parte. maxiter è il numero massimo
  % di iterazioni che si è disposti a fare e tol è un numero reale che
  % indica la tolleranza con la quale si intende accettare la soluzione.
  %
  % Qui implementiamo il *metodo di splitting*. Noi usiamo la
  % variante
  %
  %  x_0 scelto
  %  x_{n+1} = x_n+inv(P)*r_n
  %
  % dove r_n := b-A*x_n.
  %
  iter = 1;
  x = x0;
  r = b-A*x;
  res0 = norm(r);
  res_rel = tol+1; % utile ad innescare il loop che viene...
  rs(iter) = res_rel;
  invP = inverse(P); % calcoliamo l'inversa di P una volta per tutte...
                     % questo evita di sforzare inutilmente la macchina
                     % ad ogni passo dell'iterazione sotto.
  while iter < maxiter && res_rel > tol
    iter = iter+1;
    x = x+invP*r;
    r = b-A*x;
    res_rel = norm(r)/res0;
    rs(iter) = res_rel;
  end
end

