
format long;

A = [2.4 -4.4 2 1.6; 2.8 -4.8 2 3.2; 3.2 -5.2 4 .8; 3.6 -3.6 2 .4];
q0 = [1 0 0 0]';
maxiter = 1000;
tol = 1e-10;
[q lambda qs lambdas] = potenze(A, q0, maxiter, tol);

[_ eigvals R] = eig(A1, "vector");

[lambda0 i] = max(abs(eigvals1));
q0 = R(:,i);

%figure(1);
for i =1:length(qs1)
  conv_qs(i) = norm(sign(q0'*qs(:,i))*q0-qs(:,i));
end

semilogy(conv_qs, "red", "LineWIdth", 2);
hold on;

%title("storia della convergenza degli autovettori");
xlabel("numero iterazioni");

%figure(2);
for i =1:length(lambdas1)
  conv_lambdas(i) = abs(lambda0-lambdas(i));
end

semilogy(conv_lambdas, "blue", "LineWIdth", 2);
hold off;

title(["storia della convergenza degli autovalori (blu)\n"
       "storia della convergenza degli autovettori (rosso)"]);
xlabel("numero iterazioni");
ylabel("residui");

