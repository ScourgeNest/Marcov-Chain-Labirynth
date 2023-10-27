function [Link] = get_link_matrix (Labyrinth)
  
  % Functia calculeaza matricea de legaturi a grafului corespunzator labirintului
  % Initializam matricea de legaturi cu 0-uri
  Link = zeros(size(Labyrinth, 1) * size(Labyrinth, 2) + 2, size(Labyrinth, 2) * size(Labyrinth, 1) + 2);
  % Calculam numarul de linii si coloane ale matricei de adiacenta
  n = size(Labyrinth, 1) * size(Labyrinth, 2) + 2;
  m = size(Labyrinth, 2) * size(Labyrinth, 1) + 2;
  % Calculam matricea de adiacenta
  Adj = get_adjacency_matrix(Labyrinth);
  % Calculam matricea de legaturi
  for i = 1:n
    cnt = 0;
    for k = 1:m
      cnt += Adj(i, k);
    endfor
    for j = 1:m
      Link(i, j) = Adj(i,j)/ cnt;
    endfor
  endfor

endfunction
