USE movielens;

SELECT m.title AS Movie, m.release_date AS `Release Date`, g.name AS Genre, r.user_id AS `User ID`, r.rating AS Rating, u.age AS `User Age`, o.name AS Occupation 
FROM genres g
INNER JOIN genres_movies gm ON g.id=gm.genre_id 
INNER JOIN movies m ON m.id=gm.movie_id
INNER JOIN ratings r ON r.movie_id=m.id
INNER JOIN users u ON r.user_id=u.id
INNER JOIN occupations o ON u.occupation_id=o.id
ORDER BY title;