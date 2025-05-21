-- 01_inner_join.sql – INNER JOIN examples combining relational data for business insights:
-- Join cities with countries to retrieve location and regional information
-- Link countries with economies and languages to analyze inflation and official languages
-- Perform multi-table joins to explore year-based comparisons across data sets


-- ========================================================
-- SECTION 1: Basic INNER JOIN - cities and countries
-- ========================================================

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


-- ========================================================
-- SECTION 2: INNER JOIN with Aliased Tables - Inflation Data
-- ========================================================

-- Joining countries (AS c) with economies (AS e) to retrieve inflation data for 2010 and 2015
SELECT 
  c.code AS country_code,
  c.name,
  e.year,
  e.inflation_rate
FROM countries AS c
INNER JOIN economies AS e
  ON c.code = e.code;


-- ========================================================
-- SECTION 3: USING Clause - Official vs. Unofficial Languages
-- ========================================================

-- Using USING clause to simplify INNER JOIN where field names match
SELECT 
  l.code AS country_code,
  l.name,
  lang.language,
  lang.official
FROM countries AS l
INNER JOIN languages AS lang
USING (code);


-- ========================================================
-- SECTION 4: Joining Multiple Tables - Fertility vs. Unemployment
-- ========================================================

-- Combining countries, populations, and economies tables to analyze fertility and unemployment rates
SELECT 
  name, 
  e.year, 
  fertility_rate, 
  e.unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
  ON c.code = p.country_code
INNER JOIN economies AS e
  ON c.code = e.code;


-- ========================================================
-- SECTION 5: Correcting Multi-Table JOIN Conditions
-- ========================================================

-- Ensure that the JOIN also matches on year to avoid incorrect data pairing (e.g., Albania case)
SELECT 
  name, 
  e.year, 
  fertility_rate, 
  unemployment_rate
FROM countries AS c
INNER JOIN populations AS p
  ON c.code = p.country_code
INNER JOIN economies AS e
  ON c.code = e.code
 AND p.year = e.year;
