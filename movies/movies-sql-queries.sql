-- Consultas SELECT
-- 1 mostrar todos los registros de la tabla de movies
 SELECT * FROM movies;
-- 2 mostrar nombre, apellido y rating de todos los actores
SELECT first_name, last_name, rating
FROM actors;
-- 3 mostrar el titulo de todas las series
 SELECT title
 FROM series;

-- Consultas WHERE y ORDER BY
-- 4 mostrar nombre y apellido de los actores cuyo rating sea mayor a 7.5
SELECT first_name, last_name
FROM actors
WHERE rating > 7.5;
-- 5 mostrar titulo de las peliculas, rating y premios de las peliculas con un rating mayor a 7.5 y con mas de dos premios
SELECT title, rating, awards
FROM movies
WHERE rating > 7.5 AND awards > 2;
-- 6 mostrar titulo de las peliculas y rating ordenadas por rating en forma ascendente
SELECT title, rating
FROM movies
ORDER BY rating ASC; 

-- Consultas BETWEEN y LIKE
-- 7 mostrar el titulo y rating de todas las peliculas cuyo titulo incluya Toy Story
SELECT title, rating
FROM movies
WHERE title LIKE '%Toy%Story%';  
-- 8 mostrar a todos los actores cuyos nombres empiecen con Sam
SELECT * 
FROM actors
WHERE first_name LIKE 'Sam%';
-- 9 mostrar el titulo de las peliculas que salieron entre el '2004-01-01' y '2008-12-31'
SELECT title
FROM movies
WHERE release_date BETWEEN '2004-01-01' AND '2008-12-31';

-- CONSULTAS ALIAS, LIMIT y OFFSET
-- 1 mostrar titulo de todas las series y usar alias para que el nombre del campo este en espaniol
SELECT title AS titulo
FROM series;
-- 2 mostrar titulo de las peliculas con rating mayor a 3, con mas de 1 premio y con fecha lanzamiento entre anio '1988-01-01' al '2009-12-31'. Ordenar resultador por rating descendentemente.
SELECT title
FROM movies
WHERE 
	rating > 3 
    AND awards > 1 
    AND release_date BETWEEN '1988-01-01' AND '2009-12-31'
ORDER BY rating DESC;
-- 3 traer el top 3 a partir del registro 10 de la consulta anterior
SELECT title
FROM movies
WHERE 
	rating > 3 
    AND awards > 1 
    AND release_date BETWEEN '1988-01-01' AND '2009-12-31'
ORDER BY rating DESC
LIMIT 3
OFFSET 10;
-- 4 cuales son los 3 peores episodios teniendo en cuenta su rating?
SELECT title, rating
FROM episodes
ORDER BY rating
LIMIT 3;
-- obtener el listado de todos los actores. Quitar las columnas de fechas y pelicula favorita, ademas traducir los nombres de las columnas
SELECT 
	first_name AS nombre,
    last_name AS apellido,
    rating
FROM actors;