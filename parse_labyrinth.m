function [Labyrinth] = parse_labyrinth(file_path)
    
    % Deschidem fisierul pentru citire
    file_id = fopen(file_path, 'r');

    % Citim numarul de linii si de coloane
    rows = fscanf(file_id, '%d', 1);
    cols = fscanf(file_id, '%d', 1);

    % Initializam matricea labirintului
    Labyrinth = zeros(rows, cols);

    % Citim labirintul
    for r = 1:rows
        for c = 1:cols
            Labyrinth(r, c) = fscanf(file_id, '%d', 1);
        endfor
    endfor
    % Inchidem fisierul
    fclose(file_id);
    
endfunction
