-- #########################################################
-- JOIN-based techniques for identifying unmatched or
-- incomplete records across related tables
-- #########################################################

-- ========================================================
-- SECTION 1: LEFT JOIN with IS NULL - Missing Currency Data
-- ========================================================

-- Identify countries without corresponding currency information
SELECT 
  c.code AS country_code,
  c.name AS country_name
FROM countries AS c
LEFT JOIN currencies AS cur
  ON c.code = cur.code
WHERE cur.code IS NULL
ORDER BY country_name;


-- ========================================================
-- SECTION 2: RIGHT JOIN with IS NULL - Missing Country Data
-- ========================================================

-- Identify currencies that do not have a corresponding country entry
SELECT 
  cur.code AS currency_code,
  cur.name AS currency_name
FROM currencies AS cur
RIGHT JOIN countries AS c
  ON c.code = cur.code
WHERE c.code IS NULL
ORDER BY currency_name;


-- ========================================================
-- SECTION 3: FULL OUTER JOIN with NULL Filtering - Mismatch Detection
-- ========================================================

-- Combine countries and currencies and highlight mismatches from both sides
SELECT 
  c.code AS country_code,
  c.name AS country,
  cur.code AS currency_code,
  cur.name AS currency
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
WHERE c.code IS NULL OR cur.code IS NULL
ORDER BY country, currency;


-- ========================================================
-- SECTION 4: LEFT JOIN Across Time - Missing Yearly Data
-- ========================================================

-- Identify countries missing economic data for a specific year (e.g. 2015)
SELECT 
  c.name AS country,
  e.year,
  e.gdp_percapita
FROM countries AS c
LEFT JOIN economies AS e
  ON c.code = e.code AND e.year = 2015
WHERE e.code IS NULL
ORDER BY country;
