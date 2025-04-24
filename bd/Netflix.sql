USE pruebas;

SET SQL_SAFE_UPDATES = 0;

UPDATE movies
SET genre = 'Drama'
WHERE genre = 'Crimen';

SET SQL_SAFE_UPDATES = 1;