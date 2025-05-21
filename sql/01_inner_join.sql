-- 01_inner_join.sql
-- INNER JOIN example: Combining city and country data from the countries database

-- Step 1: Select all columns from the cities table
SELECT *
FROM cities;

-- Step 2: Perform an INNER JOIN between cities and countries
SELECT *
FROM cities
INNER JOIN countries
  ON cities.country_code = countries.code;

-- Step 3: Select specific columns and use aliases
SELECT 
  cities.name AS city,
  countries.name AS country,
  countries.region
FROM cities
INNER JOIN countries
  ON cities.country_code = countries.code;
