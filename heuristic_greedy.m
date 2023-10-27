function [path] = heuristic_greedy(start_position, probabilities, adjacency_matrix)

  % Folosim o euristica care ne spune sa alegem urmatorul nod in functie de
  % probabilitatea de a ajunge la Win. Daca nu mai exista vecini nevizitati,
  % ne oprim.
  probabilities = probabilities';
  probabilities = [probabilities, 1, 0];
  probabilities = probabilities';
  % Adaugam 2 linii si 2 coloane deoarece avem nevoie de 2 noduri auxiliare
  % pentru a putea calcula euristica.
  path = [start_position];
  visited = false(1, size(adjacency_matrix, 2));
  visited(start_position) = true;
  % visited este un vector care ne spune daca un nod a fost vizitat sau nu.
  n = size(adjacency_matrix, 1) - 2;
  m = size(adjacency_matrix, 2) - 2;
  % n si m sunt dimensiunile matricei de adiacenta.

  while ~isempty(path)
    % Cat timp mai avem noduri de vizitat, alegem urmatorul nod in functie
    % de euristica.
    position = path(end);
    neighbors = find(adjacency_matrix(position, :) & ~visited);
    if isempty(neighbors)
      path = path';
      % Daca nu mai avem vecini nevizitati, ne oprim.
      return;
    else
      % Alegem urmatorul nod in functie de probabilitatea cea mai mare pe care o au venicii nodului curent.
      maxim = 0;
      for i = 1:size(neighbors, 2)
        if probabilities(neighbors(i)) > maxim
          maxim = probabilities(neighbors(i));
          next = neighbors(i);
        endif
      endfor
      % Adaugam nodul in path si il marcam ca vizitat.
      visited(next) = true;
      path = [path, next];
    endif
  endwhile
  % Returnam path-ul.
  
endfunction
