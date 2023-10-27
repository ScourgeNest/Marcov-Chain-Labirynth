function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)

	% Folosim metoda iterativa Jacobi pentru a rezolva sistemul de ecuatii
	% Ax = b, unde A = G, b = c, x = x0.
	[n, ~] = size(G);
	x = x0;
	err = 1;
	steps = 0;

	for k = 1:max_steps
		x_old = x;
		x = G * x_old + c;
		% Calculam eroarea.
		err = norm(x - x_old);
		steps = k;
		% Daca eroarea este mai mica decat toleranta, ne oprim.
		if err < tol
			break;
		endif
	endfor
	
endfunction
	