-- ========================================================
-- SECTION 1: LEFT JOIN - Cities and Countries
-- ========================================================

-- Returns all records from cities (AS c1), with matching country info if available
-- Useful for finding cities with or without a matching country record
SELECT 
    c1.name AS city, 
    code, 
    c2.name AS country,
    region, 
    city_proper_pop
FROM cities AS c1
LEFT JOIN countries AS c2
  ON c1.country_code = c2.code
ORDER BY code DESC;


-- ========================================================
-- SECTION 2: LEFT JOIN + Aggregation - Average GDP by Region (2010)
-- ========================================================

-- Calculate average GDP per capita per region in 2010
SELECT 
  region, 
  AVG(gdp_percapita) AS avg_gdp
FROM countries AS c
LEFT JOIN economies AS e
  USING(code)
WHERE year = 2010
GROUP BY region
ORDER BY avg_gdp DESC
LIMIT 10;


-- ========================================================
-- SECTION 3: RIGHT JOIN Equivalent to LEFT JOIN
-- ========================================================

-- Demonstrates how RIGHT JOIN can produce the same result as LEFT JOIN
-- Retrieves all countries, whether or not a language match exists
SELECT 
  countries.name AS country, 
  languages.name AS language, 
  percent
FROM languages
RIGHT JOIN countries
  USING(code)
ORDER BY language;
