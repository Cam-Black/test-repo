USE movielens;

-- List the titles and release dates of movies released between 1983-1993 in reverse chronological order.
SELECT title AS Movie, release_date AS `Release Date` 
FROM movies 
WHERE release_date BETWEEN '1983-01-01' AND '1993-01-01'
ORDER BY release_date ASC;

-- Without using LIMIT, list the titles of the movies with the lowest average rating.
SELECT m.title AS Movie, AVG(r.rating) AS Average_Rating
FROM movies m
INNER JOIN ratings r ON m.id = r.movie_id
GROUP BY m.title
HAVING Average_Rating = (
	SELECT MIN(Average_Rating)
	FROM (
		SELECT AVG(r.rating) AS Average_Rating
        FROM ratings r
        GROUP BY movie_id
    ) AS Table1
)
ORDER BY AVG(r.rating) ASC;

-- List the unique records for Sci-Fi movies where male 24-year-old students have given 5-star ratings.
SELECT m.title AS Movie
FROM movies m
INNER JOIN genres_movies gm ON m.id = gm.movie_id 
INNER JOIN genres g ON g.id = gm.genre_id
INNER JOIN ratings r ON r.movie_id = m.id
INNER JOIN users u ON r.user_id = u.id
INNER JOIN occupations o ON u.occupation_id = o.id
WHERE g.name = 'sci-fi' AND u.gender = 'M' AND u.age = 24 AND o.name = 'Student' AND r.rating = 5
GROUP BY title
ORDER BY title;

-- List the unique titles of each of the movies released on the most popular release day.
SELECT title AS Movie, release_date AS ReleaseDate
FROM movies
WHERE release_date = (
	SELECT release_date
    FROM movies
    GROUP BY release_date 
    ORDER BY COUNT(release_date) DESC
    LIMIT 1)
ORDER BY title ASC;

-- Find the total number of movies in each genre; list the results in ascending numeric order.
SELECT COUNT(g.name) AS `Number of Movies`, g.name AS Genre
FROM genres g
INNER JOIN genres_movies gm ON gm.genre_id = g.id
GROUP BY g.name
ORDER BY COUNT(g.name) ASC;