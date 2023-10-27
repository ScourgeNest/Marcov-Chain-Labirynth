function [G, c] = get_Jacobi_parameters (Link)
  
  % Returnez matricea G si vectorul c din matricea Link
  G = zeros(size(Link, 1), size(Link, 2));
  c = zeros(size(Link, 1), 1);
  G = Link(1:end-2, 1:end-2);
  c = Link(1:end-2, end-1);

endfunction
