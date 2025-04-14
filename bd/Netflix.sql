CREATE DATABASE pruebas;
USE pruebas;

CREATE TABLE movies (
	idMovie INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
	title VARCHAR(45) NOT NULL,
    genre VARCHAR(45) NOT NULL,
    image VARCHAR(1000) NOT NULL,
    category VARCHAR(45) NOT NULL, 
    year INT
);

CREATE TABLE actors (
	idActor INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    name VARCHAR(45) NOT NULL,
    lastname VARCHAR(45) NOT NULL,
    country VARCHAR(45) NOT NULL,
    birthday DATE
);

CREATE TABLE users (
	idUser INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    user VARCHAR(45) NOT NULL,
    password VARCHAR(45) NOT NULL,
    email VARCHAR(45) NOT NULL,
    plan_details VARCHAR(45) NOT NULL
);

SELECT * FROM movies;

INSERT INTO  movies (title, genre, image, category, year)
VALUES 
	('Pulp Fiction', 'Crimen', 'https://pics.filmaffinity.com/pulp_fiction-210382116-large.jpg', 'Top 10', 1994), 
	('La vita è bella', 'Comedia', 'https://pics.filmaffinity.com/la_vita_e_bella-646167341-mmed.jpg', 'Top 10', 1996),
    ('Forrest Gump', 'Comedia', 'https://pics.filmaffinity.com/forrest_gump-212765827-mmed.jpg', 'Top 10', 1994);
    
ALTER TABLE users ADD COLUMN name VARCHAR(45) NOT NULL; 

INSERT INTO users (user, password, name, email, plan_details)
VALUES
	('laura_dev', 'laura', 'Laura', 'laura@gmail.com', 'Standard'),
    ('maria_dev', 'maria', 'Maria', 'maria@gmail.com', 'Standard'),
    ('ester_dev', 'ester', 'Ester', 'ester@gmail.com', 'Standard');
    
INSERT INTO actors (name, lastname, country, birthday)
VALUES 
	('Tom', 'Hanks', 'Estados Unidos', '1956-07-09'),
	('Roberto', 'Benigni', 'Italia', '1952-10-27'),
	('John', 'Travolta', 'Estados Unidos', '1954-02-18');

SELECT * FROM actors;

DELETE FROM users WHERE idUser = 4;
DELETE FROM users WHERE idUser = 5;
DELETE FROM users WHERE idUser = 6;
DELETE FROM actors WHERE idActor = 4;
DELETE FROM actors WHERE idActor = 5;
DELETE FROM actors WHERE idActor = 6;

SELECT * FROM movies_has_users;

INSERT INTO movies_has_users (fk_users, fk_movies)
VALUES 
	(1, 1),
    (1, 2),
    (2, 2);

SELECT users.user, movies.title
FROM users, movies, movies_has_users
WHERE movies_has_users.fk_movies = movies.idMovie
AND movies_has_users.fk_users = users.idUser;





