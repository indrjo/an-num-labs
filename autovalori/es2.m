
format long;

A1 = [5 3 4; 3 5 2; 4 2 5];
T = [8 1 6; 3 5 7; 4 9 2];
A2 = inverse(T)*A1*T;
q0 = [1 0 0]';
maxiter = 100;
tol = 1e-10;
[q1 lambda1 qs1 lambdas1] = potenze(A1, q0, maxiter, tol);
[q2 lambda2 qs2 lambdas2] = potenze(A2, q0, maxiter, tol);

[L1 eigvals1 R1] = eig(A1, "vector");
[L2 eigvals2 R2] = eig(A2, "vector");

[lambda01 i1] = max(abs(eigvals1));
q01 = R1(:,i1);

[lambda02 i2] = max(abs(eigvals1));
q02 = R2(:,i1);

figure(1);
for i =1:length(qs1)
  conv_qs1(i) = norm(sign(q01'*qs1(:,i))*q01-qs1(:,i));
end

semilogy(conv_qs1, "red", "LineWIdth", 2);
hold on;

for i =1:length(qs2)
  conv_qs2(i) = norm(sign(q02'*qs2(:,i))*q02-qs2(:,i));
end

semilogy(conv_qs1, "blue", "LineWIdth", 2);
hold off;
title("storia della convergenza degli autovettori");
xlabel("numero iterazioni");

figure(2);
for i =1:length(lambdas1)
  conv_lambdas1(i) = abs(lambda01-lambdas1(i));
end

semilogy(conv_lambdas1, "red", "LineWIdth", 2);
hold on;

for i =1:length(lambdas2)
  conv_lambdas2(i) = abs(lambda02-lambdas2(i));
end

semilogy(conv_lambdas2, "blue", "LineWIdth", 2);
hold off;

title("storia della convergenza degli autovalori");
xlabel("numero iterazioni");

