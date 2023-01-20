function [x] = solve_triangular(A,b)
  if istril(A)
    [x] = solve_lower_triangular(A,b);
  elseif istriu(A)
    [x] = solve_upper_triangular(A,b);
  else
    disp("the matrix isn't triangular!");
    return;
  end
end
