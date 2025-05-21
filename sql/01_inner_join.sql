-- Perform an inner join with the cities table on the left and the countries table on the right;

SELECT * 
FROM cities 
INNER JOIN countries
ON cities.country_code = countries.code;
