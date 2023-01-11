
%%%%%%%%%%%%%%%
% Esercizio 4 %
%%%%%%%%%%%%%%%

A = gallery("poisson", 40);
[n n] = size(A);
b = A*ones(n,1);
x0 = b;

maxiter = 50;
tol = .01;

[x1, r1, iter1] = CG(A, b, x0, maxiter, tol);
[x2, r2, iter2] = jacobi(A, b, x0, maxiter, tol);
[x3, r3, iter3] = gauss_seidel(A, b, x0, maxiter, tol);

semilogy(1:.5:maxiter, tol, "green", "LineWidth", 2)
hold on
semilogy(r1, "red", "LineWidth", 2)
hold on
semilogy(r2, "blue", "LineWidth", 2)
hold on
semilogy(r3, "green", "LineWidth", 2)
title(["iter=" num2str(maxiter) ", tol=" num2str(tol)])
hold off

title(["[rosso] metodo gradiente coniugato, " num2str(iter1) " iterazioni"
       "[blu] metodo di Jacobi, [verde] metodo di Gauss-Seidel"])

xlabel("numero iterazioni")
ylabel("|b-Ax_n|/|b-Ax_0|")

%print es4.png

