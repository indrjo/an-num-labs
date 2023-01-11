
%%%%%%%%%%%%%%%
% Esercizio 2 %
%%%%%%%%%%%%%%%

format long

A = [7 6 3; 2 5 -4; -4 -3 8];
b = [3 -1 2]';
x0 = b;
maxiter = 50;
tol = .001;

% Calcolo delle soluzioni approssimate usando i metodi di Jacobi
% e Gauss-Seidel.
[x1, r1, iter1] = jacobi(A, b, x0, maxiter, tol);
[x2, r2, iter2] = gauss_seidel(A, b, x0, maxiter, tol);

% Grafici numero iterazioni vs residuo/(residuo iniziale)
semilogy(1:.5:maxiter, tol, "green", "LineWidth", 2)
hold on
semilogy(r1, "red", "LineWidth", 2)
hold on
semilogy(r2, "blue", "LineWidth", 2)
hold off

title(["[rosso] metodo di Jacobi, " num2str(iter1) " iterazioni"
       "[blu] metodo di Gauss-Seidel, " num2str(iter2) " iterazioni"])
xlabel("numero iterazioni")
ylabel("norm(b-Ax_n)/norm(b-Ax_0)")

