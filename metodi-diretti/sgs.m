function [Q R] = sgs(A)
  [m n] = size(A);
  Q = A;
  R = zeros(n, n);
  for i = 1:n
    for j = 1:i-1
      R(j,i) = Q(:,j)'*A(:,i);
      Q(:,i) = Q(:,i)-R(j,i)*Q(:,j);
    end
    R(i,i) = norm(Q(:,i));
    Q(:,i) = Q(:,i)/R(i,i);
  end
end
