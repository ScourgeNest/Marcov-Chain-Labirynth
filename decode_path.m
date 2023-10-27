function [decoded_path] = decode_path (path, lines, cols)

  % Decodifica calea din reprezentarea ei ca vector de indici
  n = length(path) - 1;
  % Parcurgem vectorul de indici si calculam coordonatele
  decoded_path = zeros(n, 2);
	  for i = 1:n
		for j = 1:2
			if j == 1
				% Calculam linia pe care se afla nodul
				decoded_path(i, j) = floor((path(i) - 1)/cols) + 1;
			else
				% Calculam coloana pe care se afla nodul
				decoded_path(i, j) = mod(path(i) - 1, cols) + 1;
			endif
		endfor
	endfor

endfunction