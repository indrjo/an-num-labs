function [x] = solve_upper_triangular(A,b)
  n = length(b);
  x(n) = b(n)/A(n,n);
  for i = 1:n
    i = n-i+1;
    x(i) = (b(i) - A(i,i+1:n) * x(i+1:n)')/A(i,i);
  end
  x = x';
end
