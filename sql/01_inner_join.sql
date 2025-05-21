-- Perform an inner join with the cities table on the left and the countries table on the right;

SELECT * 
FROM cities 
-- Inner join to countries
INNER JOIN countries
-- Match on country codes
ON cities.country_code = countries.code;
