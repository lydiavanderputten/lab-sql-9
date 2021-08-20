USE Sakila;
-- How many distinct (different) actors' last names are there?
Select * from Sakila.actor;

SELECT last_name, COUNT(DISTINCT last_name)
FROM Sakila.actor a
GROUP BY last_name;

-- Add an additional column day_type with values 'weekend' and 'workday' depending on the rental day of the week.
SELECT * from rental;

SELECT rental_id, WEEKDAY(rental_date)

CASE
WHEN WEEKDAY(rental_date) > 05 THEN 'weekend'
ELSE 'workday'
END AS day_type;

-- Get all films with ARMAGEDDON in the title.
SELECT * from Sakila.film;
SELECT title
FROM Sakila.film 
WHERE title LIKE ('%ARMAGEDDON%');

-- Get 10 the longest films.
SELECT * from Sakila.film;
SELECT title, length
FROM film
ORDER BY length DESC
LIMIT 10; 

-- How many films include Behind the Scenes content?
SELECT * from Sakila.film;
SELECT title, special_features
FROM Sakila.film
WHERE special_features LIKE ('%Behind the Scenes%');

SELECT special_features , COUNT(*) 
FROM Sakila.film
WHERE special_features = 'Behind the Scenes'; 

-- Which kind of movies (rating) have a mean duration of more than two hours?
SELECT * from Sakila.film;

SELECT (AVG(length)) as 'Average_Length', rating
FROM Sakila.film
GROUP BY rating 
HAVING Average_Length>= 120;

SELECT rating, (AVG(length)) as "avg_length" 
FROM sakila.film 
GROUP BY rating 
HAVING avg_length>=120;

-- Rank films by length (filter out the rows that have nulls or 0s in length column). In your output, only select the columns title, length, and the rank.
SELECT * from Sakila.film;

SELECT title, length, RANK () over (ORDER  BY length DESC)
FROM Sakila.film
WHERE length is not NULL;



