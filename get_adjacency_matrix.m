function [Adj] = get_adjacency_matrix (Labyrinth)
  
  % Functia primeste ca parametru o matrice reprezentand labirintul si
  % returneaza matricea de adiacenta a grafului corespunzator labirintului.
  Adj = zeros(size(Labyrinth, 1)*size(Labyrinth, 2) + 2, size(Labyrinth, 1)*size(Labyrinth, 2) + 2);
  n =size(Labyrinth, 1);
  m = size(Labyrinth, 2);
  Adj(end - 1, end - 1) = 1;
  Adj(end, end) = 1;

  % Parcurg matricea si construiesc matricea de adiacenta.
  for i = 1:n
      for j = 1:m
          node = (i-1)*m + j;
          bits = dec2bin(Labyrinth(i, j), 4);

          if bits(1) == '0' && i > 1
            Adj(node, node - m) = 1;
            Adj(node - m, node) = 1;
          endif

          if bits(2) == '0' && i < n
            Adj(node, node + m) = 1;
            Adj(node + m, node) = 1;
          endif

          if bits(3) == '0' && j < m
            Adj(node, node + 1) = 1;
            Adj(node + 1, node) = 1;
          endif

          if bits(4) == '0' && j > 1
            Adj(node, node - 1) = 1;
            Adj(node - 1, node) = 1;
          endif
          

          if bits(1) == '0' && i == 1
            Adj(node, end - 1) = 1;
          endif

          if bits(2) == '0' && i == n
            Adj(node, end - 1) = 1;
          endif

          if bits(3) == '0' && j == m
            Adj(node, end) = 1;
          endif

          if bits(4) == '0' && j == 1
            Adj(node, end) = 1;
          endif
      endfor
  endfor

endfunction