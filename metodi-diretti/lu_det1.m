function x = lu_det1(A)
  [L U P] = lu_piv(A);
  x = det(P)*det(U);
end

