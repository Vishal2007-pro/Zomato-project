CREATE DATABASE zomato_project;
USE zomato_project;

SELECT COUNT(*) AS total_rows
FROM restaurants;

SELECT *
FROM restaurants
LIMIT 5;

SELECT COUNT(*) AS total_rows,
       SUM(`Rating status` = 'Not rated') AS not_rated_rows,
       SUM(`Aggregate rating` IS NULL) AS missing_ratings
FROM restaurants;

SELECT COUNT(*) AS total_rows,
       SUM(`Rating status` = 'Not rated') AS not_rated_rows
FROM restaurants_v2;

USE zomato_project;
SELECT
    COUNT(*) AS total_restaurants,
    SUM(`Rating status` = 'Rated') AS rated_restaurants,
    SUM(`Rating status` = 'Not rated') AS not_rated_restaurants
FROM restaurants_v2;

SELECT
    City,
    COUNT(*) AS restaurant_count
FROM restaurants_v2
GROUP BY City
ORDER BY restaurant_count DESC
LIMIT 10;

SELECT
    `Restaurant Name`,
    City,
    Cuisines,
    `Aggregate rating`,
    Votes
FROM restaurants_v2
WHERE `Rating status` = 'Rated'
  AND Votes >= 100
ORDER BY `Aggregate rating` DESC, Votes DESC
LIMIT 10;


SELECT
    `Has Online delivery`,
    COUNT(*) AS restaurants,
    ROUND(AVG(`Aggregate rating`), 2) AS average_rating,
    ROUND(AVG(Votes), 0) AS average_votes
FROM restaurants_v2
GROUP BY `Has Online delivery`;

SELECT
    `Price range`,
    COUNT(*) AS restaurants,
    ROUND(AVG(`Aggregate rating`), 2) AS average_rating,
    ROUND(AVG(`Average Cost for two`), 0) AS average_cost
FROM restaurants_v2
WHERE `Rating status` = 'Rated'
GROUP BY `Price range`
ORDER BY `Price range`;
