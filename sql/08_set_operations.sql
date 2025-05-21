-- #########################################################
-- UNION operation to combine rows from separate datasets
-- and eliminate duplicates (set-based logic)
-- #########################################################

-- ========================================================
-- SECTION 1: UNION – Economies in 2015 and 2019
-- ========================================================

-- Combine distinct records from two snapshots of global economies
-- Returns distinct rows only (no duplicates)
SELECT code, year, gdp_percapita, inflation_rate
FROM economies2015

UNION

SELECT code, year, gdp_percapita, inflation_rate
FROM economies2019

ORDER BY code, year;


-- ========================================================
-- SECTION 2: Comparing UNION vs UNION ALL – Country-Year Pairs
-- ========================================================

-- Use UNION to return unique country-year combinations from two sources
SELECT code, year
FROM economies

UNION

SELECT country_code AS code, year
FROM populations

ORDER BY code, year;

-- Use UNION ALL to return all values including duplicates
SELECT code, year
FROM economies

UNION ALL

SELECT country_code AS code, year
FROM populations

ORDER BY code, year;


-- ========================================================
-- SECTION 3: INTERSECT – Country-Year Pairs Present in Both Tables
-- ========================================================

-- Return only the country-year combinations found in both tables
SELECT code, year
FROM economies

INTERSECT

SELECT country_code AS code, year
FROM populations

ORDER BY code, year;


-- ========================================================
-- SECTION 4: EXCEPT – Economies Not Found in Populations
-- ========================================================

-- Return country-year combinations from economies missing in populations
SELECT code, year
FROM economies

EXCEPT

SELECT country_code AS code, year
FROM populations

ORDER BY code, year;


-- ========================================================
-- SECTION 5: EXCEPT – Populations Not Found in Economies
-- ========================================================

-- Return country-year combinations from populations missing in economies
SELECT country_code AS code, year
FROM populations

EXCEPT

SELECT code, year
FROM economies

ORDER BY code, year;
