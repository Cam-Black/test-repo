USE sakila;

-- List all actors.
SELECT * FROM actor;

-- Find the surname of the actor with the forename 'John'.
SELECT first_name AS Forename, last_name as Surname 
FROM actor 
WHERE first_name = 'John';

-- Find all actors with surname 'Neeson'.
SELECT first_name AS Forename, last_name AS Surname
FROM actor 
WHERE last_name = 'Neeson'; 

-- Find all actors with ID numbers divisible by 10.
SELECT actor_id AS ID, CONCAT(first_name, ' ', last_name) AS Name 
FROM actor
WHERE actor_id % 10 = 0;

-- What is the description of the movie with an ID of 100?
SELECT title AS Movie, description AS Description 
FROM film 
WHERE film_id = 100;

-- Find every R-rated movie.
SELECT title AS Movie, rating AS Rating 
FROM film
WHERE rating = 'R'; 

-- Find every non-R-rated movie.
SELECT title AS Movie, rating AS Rating 
FROM film
WHERE rating != 'R';

-- Find the ten shortest movies.
SELECT title AS Movie, length AS Runtime
FROM film
ORDER BY length ASC
LIMIT 10;

-- Find the movies with the longest runtime, without using LIMIT.
SELECT title AS Movie, length AS Runtime
FROM film
ORDER BY length DESC;

-- Find all movies that have deleted scenes.
SELECT title AS Movie, special_features AS `Special Features`
FROM film
WHERE special_features LIKE '%Deleted Scenes%'
ORDER BY title;

-- Using HAVING, reverse-alphabetically list the last names that are not repeated.
SELECT last_name AS Surname
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) <= 1
ORDER BY last_name DESC;

-- Using HAVING, list the last names that appear more than once, from highest to lowest frequency.
SELECT last_name AS Surname, COUNT(last_name) AS Frquency
FROM actor
GROUP BY last_name
HAVING COUNT(last_name) > 1
ORDER BY COUNT(last_name) DESC;

-- Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS Actor, COUNT(a.actor_id) AS Appearances
FROM actor a
INNER JOIN film_actor fa ON a.actor_id=fa.actor_id
GROUP BY Actor
ORDER BY COUNT(Actor) DESC
LIMIT 1;

-- When is 'Academy Dinosaur' due?
SELECT f.title AS Movie, f.rental_duration AS `Rental Length`, r.return_date AS `Return Date`
FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN rental r ON r.inventory_id=i.inventory_id
WHERE title = 'Academy Dinosaur' AND r.return_date IS NOT NULL
ORDER BY r.return_date DESC
LIMIT 1;

-- What is the average runtime of all films?
SELECT AVG(length) AS `Average Film Runtime` FROM film;

-- List the average runtime for every film category.
SELECT c.name AS Category, AVG(f.length) AS `Average Runtime`
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
GROUP BY c.name;

-- List all movies featuring a robot.
SELECT film_id AS ID, title AS Movie, description 
FROM film 
WHERE description LIKE '%robot%'
ORDER BY film_id ASC;

-- How many movies were released in 2010?
SELECT COUNT(release_year) 
FROM film 
WHERE release_year = 2010;

-- Find the titles of all the horror movies.
SELECT f.title AS Movie
FROM film f
INNER JOIN film_category fc ON f.film_id = fc.film_id
INNER JOIN category c ON c.category_id = fc.category_id
WHERE c.name='Horror';

-- List the full name of the staff member with the ID of 2.
SELECT CONCAT(first_name, ' ', last_name) AS `Staff Member`
FROM staff 
WHERE staff_id = 2;

-- List all the movies that Fred Costner has appeared in.
SELECT f.title AS Movie 
FROM film f
INNER JOIN film_actor fa ON f.film_id = fa.film_id
INNER JOIN actor a ON a.actor_id = fa.actor_id
WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Fred Costner';

SELECT f.title AS Movie
FROM film f
INNER JOIN film_actor fa ON fa.film_id = f.film_id
WHERE fa.actor_id = (
	SELECT actor_id
    FROM actor a
    WHERE CONCAT(a.first_name, ' ', a.last_name) = 'Fred Costner'
    );

-- How many distinct countries are there?
SELECT DISTINCT COUNT(country) AS `Number of Distinct Countries`
FROM country;

-- List the name of every language in reverse-alphabetical order.
SELECT name AS Language 
FROM language
ORDER BY language DESC;

-- List the full names of every actor whose surname ends with '-son' in alphabetical order by their forename.
SELECT CONCAT(a.first_name, ' ', a.last_name)
FROM actor a 
WHERE a.last_name LIKE '%son';

-- Which category contains the most films?
SELECT c.name AS Category, COUNT(fc.category_id) AS `Number of Films in Category`
FROM category c
INNER JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY fc.category_id
ORDER BY COUNT(fc.category_id) DESC
LIMIT 1;