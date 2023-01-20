
%%%%%%%%%%%%%%%
% Esercizio 3 %
%%%%%%%%%%%%%%%

n = 30;
A = eye(n);
for i = 2:n
  A(i, i-1) = 0.16;
  A(i-1, i) = -1.16;
end

b = ones(30, 1);

x0 = b;
maxiter = 200;
tol = .01;
%x = A\b;

[x1, r1, iter1] = jacobi(A, b, x0, maxiter, tol);
[x2, r2, iter2] = gauss_seidel(A, b, x0, maxiter, tol);

semilogy(1:maxiter, tol, "green", "LineWidth", 2)
hold on
semilogy(r1, "red", "LineWidth", 2)
hold on
semilogy(r2, "blue", "LineWidth", 2)
hold off

title(["[rosso] jacobi, " num2str(iter1) " iterazioni"
       "[blu] gauss-seidel, " num2str(iter2) " iterazioni"])
xlabel("numero iterazioni")
ylabel("|b-Ax_n|/|b-Ax_0|")
