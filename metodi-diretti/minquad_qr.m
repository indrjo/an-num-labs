function [c] = minquad_qr(n, x, y)
  A = vandermonde(n, x');
  % Dobbiamo risolvere il problema A'*Ac = A'y in c.
  [Q R] = sgs(A);
  % Qui Q è una matrice m*m, mentre R è m*(n+1).
  % Ma R è trapeizoidale superiore, quindi
  Q = Q(:,1:n+1);
  R = R(1:n+1,:);
  c = (inverse_lu(R) * Q') * y;
end

