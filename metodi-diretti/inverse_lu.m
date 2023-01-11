function [X] = inverse_lu(A)
  [L U P] = lu_piv(A);
  n = rows(A);
  for i=1:n
    Y = solve_lower_triangular(L, P(:,i));
    X(:,i) = solve_upper_triangular(U, Y);
  end
end
