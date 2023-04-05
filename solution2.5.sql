-- 1. Select all the actors with the first name ‘Scarlett’.
SELECT * from actor
WHERE first_name = 'Scarlett';

-- 2. How many physical copies of movies are available for rent in the store's inventory? How many unique movie titles are available?
SELECT COUNT(inventory_id) FROM inventory;
SELECT COUNT(distinct(film_id)) FROM inventory;

-- 3. What are the shortest and longest movie duration? 
-- Name the values max_duration and min_duration.
SELECT title, min(length) as 'min_duration',max(length) as 'max_duration' FROM film;

-- 4. What's the average movie duration expressed in format (hours, minutes)?
SELECT CONVERT(AVG(length),time) from film;

-- 5. How many distinct (different) actors' last names are there?
SELECT COUNT(distinct(last_name)) from actor;

-- 6. How many days was the company operating? 
-- Assume the last rental date was their closing date. (check DATEDIFF() function)
SELECT min(rental_date),max(rental_date) FROM rental;
SELECT DATEDIFF('2005-05-24 22:53:30', '2006-02-14 15:16:03');

-- 7. Show rental info with additional columns month and weekday. Get 20 results.
SELECT * from rental;
SELECT *, date_format(rental_date,"%M") AS 'rental_month', 
date_format(rental_date,"%a") AS 'Weekday' 
FROM rental
LIMIT 20;

-- 8. Add an additional column day_type with values 'weekend' and 'workday' 
-- depending on the rental day of the week.
SELECT *, date_format(rental_date,"%a"),
CASE 
WHEN date_format(rental_date,"%a") in ('Sat','Sun') THEN 'Weekend'
ELSE 'Weekday'
END AS 'day_type'
FROM rental;

-- 9. Get release years.
SELECT release_year FROM film;

-- 10. Get all films with ARMAGEDDON in the title.
SELECT title FROM film
WHERE title LIKE '%ARMAGEDDON%';

-- 11. Get all films which title ends with APOLLO.
SELECT title from film
WHERE title LIKE '%APOLLO';

-- 12. Get 10 the longest films
SELECT title from film
ORDER BY length DESC
LIMIT 10;

-- 13. How many films include Behind the Scenes content?
SELECT distinct special_features from film;
SELECT count(special_features) from film
WHERE special_features LIKE '%Behind the Scenes%';


