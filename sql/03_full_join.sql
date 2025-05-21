-- 03_full_join.sql – FULL OUTER JOIN examples to analyze unmatched data and join coverage:
-- Combine countries with currencies and languages to examine data completeness
-- Identify unmatched country or currency records
-- Classify match status using CASE logic and count distributions
-- Chain multiple FULL JOINs to explore regional relationships (e.g., Melanesia, Micronesia)


-- ========================================================
-- SECTION 1: FULL OUTER JOIN - Countries and Currencies (North America)
-- ========================================================

-- Return all countries and currencies, including unmatched records
-- Focus on North American region and rows with missing country names
SELECT 
    c.code,
    c.name AS country,
    cur.name AS currency,
    c.region
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
WHERE c.region = 'North America' OR c.name IS NULL
ORDER BY country;


-- ========================================================
-- SECTION 2: FULL OUTER JOIN - Identify unmatched country-currency codes
-- ========================================================

-- Use FULL OUTER JOIN to detect rows where either side lacks a match
SELECT 
    c.code AS country_code,
    c.name AS country,
    cur.code AS currency_code,
    cur.name AS currency
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
WHERE c.code IS NULL OR cur.code IS NULL
ORDER BY country_code, currency_code;


-- ========================================================
-- SECTION 3: FULL OUTER JOIN - Coverage Overview
-- ========================================================

-- Count number of records from both countries and currencies tables
-- including total matches and unmatched rows
SELECT 
    COUNT(*) AS total_records
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code;


-- ========================================================
-- SECTION 4: FULL OUTER JOIN - Match Status with CASE
-- ========================================================

-- Classify each row based on match type: Match, Country only, or Currency only
SELECT 
  c.code,
  c.name AS country,
  cur.name AS currency,
  CASE 
    WHEN c.code IS NULL THEN 'Currency only'
    WHEN cur.code IS NULL THEN 'Country only'
    ELSE 'Match'
  END AS match_status
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
ORDER BY match_status;


-- ========================================================
-- SECTION 5: FULL OUTER JOIN - Count by Match Status
-- ========================================================

-- Aggregate match status to understand data distribution
SELECT 
  CASE 
    WHEN c.code IS NULL THEN 'Currency only'
    WHEN cur.code IS NULL THEN 'Country only'
    ELSE 'Match'
  END AS status,
  COUNT(*) AS count
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
GROUP BY status
ORDER BY count DESC;


-- ========================================================
-- SECTION 6: Chaining FULL OUTER JOINs - Countries, Languages, and Currencies
-- ========================================================

-- Combine countries with languages and currencies using consecutive FULL OUTER JOINs
-- Useful for wide coverage in regional or linguistic research (e.g., Melanesia & Micronesia)
SELECT 
  c1.code,
  c1.name AS country,
  l.language,
  cur.name AS currency
FROM countries AS c1
FULL OUTER JOIN languages AS l
  ON c1.code = l.code
FULL OUTER JOIN currencies AS cur
  ON c1.code = cur.code
ORDER BY country, language;
