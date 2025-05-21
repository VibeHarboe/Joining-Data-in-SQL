-- #########################################################
-- Subqueries to filter, aggregate, and correlate results
-- within SELECT, FROM, and WHERE clauses
-- #########################################################

-- ========================================================
-- SECTION 1: SEMI JOIN – Distinct Languages Used in the Middle East
-- ========================================================

-- Return unique languages spoken in countries from the Middle East region
SELECT DISTINCT language
FROM languages
WHERE code IN (
  SELECT code
  FROM countries
  WHERE region = 'Middle East'
);


-- ========================================================
-- SECTION 2: Subquery in WHERE – Countries Above Avg GDP
-- ========================================================

-- Find countries with GDP per capita above the global average in 2015
SELECT name, gdp_percapita
FROM countries AS c
JOIN economies AS e
  ON c.code = e.code
WHERE e.year = 2015
  AND gdp_percapita > (
    SELECT AVG(gdp_percapita)
    FROM economies
    WHERE year = 2015
  )
ORDER BY gdp_percapita DESC;


-- ========================================================
-- SECTION 3: ANTI JOIN – Missing Oceanian Currencies
-- ========================================================

-- Identify Oceanian countries not represented in the currencies table
SELECT name
FROM countries
WHERE continent = 'Oceania'
  AND code NOT IN (
    SELECT code
    FROM currencies
  )
ORDER BY name;


-- ========================================================
-- SECTION 4: Subquery in WHERE – Life Expectancy Above 1.15x Global Avg
-- ========================================================

-- Find countries in 2015 where life expectancy was more than 15% above the global average
SELECT *
FROM populations
WHERE life_expectancy > 1.15 * (
    SELECT AVG(life_expectancy)
    FROM populations
    WHERE year = 2015
  )
  AND year = 2015
ORDER BY life_expectancy DESC;


-- ========================================================
-- SECTION 5: Subquery in WHERE – Capital Cities Ordered by Urban Population
-- ========================================================

-- Return capital cities sorted by urban area population (largest to smallest)
SELECT name, country_code, urbanarea_pop
FROM cities
WHERE name IN (
  SELECT capital
  FROM countries
)
ORDER BY urbanarea_pop DESC;


-- ========================================================
-- SECTION 6: Subquery in SELECT – Countries with Most Cities (Alternative to JOIN)
-- ========================================================

-- Use a subquery to count how many cities each country has in the cities table
-- Return the top 9 countries based on city count
SELECT name,
  (
    SELECT COUNT(*)
    FROM cities
    WHERE country_code = countries.code
  ) AS cities_num
FROM countries
ORDER BY cities_num DESC
LIMIT 9;


-- ========================================================
-- SECTION 7: Subquery in FROM – Number of Languages per Country
-- ========================================================

-- Return local_name of each country with number of spoken languages joined via subquery
SELECT local_name, sub.lang_num
FROM countries,
  (
    SELECT code, COUNT(*) AS lang_num
    FROM languages
    GROUP BY code
  ) AS sub
WHERE countries.code = sub.code
ORDER BY lang_num DESC;


-- ========================================================
-- SECTION 8: Subquery in WHERE – Filtering by Form of Government
-- ========================================================

-- Return inflation and unemployment rates for countries that are republics or monarchies
SELECT code, inflation_rate, unemployment_rate
FROM economies
WHERE year = 2015
  AND code IN (
    SELECT code
    FROM countries
    WHERE gov_form LIKE '%Republic%'
       OR gov_form LIKE '%Monarchy%'
  );


-- ========================================================
-- SECTION 9: Subquery in WHERE – Top Capital Cities by Proper-to-Metro Population Share
-- ========================================================

-- Return top 10 capital cities in Europe and the Americas with the highest proper-to-metro population share
SELECT name, country_code, city_proper_pop, metroarea_pop,
  ROUND(city_proper_pop * 100.0 / metroarea_pop, 2) AS city_perc
FROM cities
WHERE name IN (
  SELECT capital
  FROM countries
  WHERE continent = 'Europe'
     OR continent LIKE '%America'
)
  AND metroarea_pop IS NOT NULL
ORDER BY city_perc DESC
LIMIT 10;
