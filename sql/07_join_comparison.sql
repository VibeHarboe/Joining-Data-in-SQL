-- #########################################################
-- Comparative JOIN examples to evaluate differences in
-- results across INNER, LEFT, and FULL OUTER JOINs
-- #########################################################

-- ========================================================
-- SECTION 1: Compare INNER vs LEFT JOIN - Countries & Economies
-- ========================================================

-- Count of countries with matching economy data in 2010
SELECT COUNT(*) AS inner_match_count
FROM countries AS c
INNER JOIN economies AS e
  ON c.code = e.code
WHERE e.year = 2010;

-- Count of all countries (matched or not) in 2010
SELECT COUNT(*) AS left_total_count
FROM countries AS c
LEFT JOIN economies AS e
  ON c.code = e.code
WHERE e.year = 2010 OR e.code IS NULL;


-- ========================================================
-- SECTION 2: Compare INNER vs FULL OUTER JOIN - Total Coverage
-- ========================================================

-- Count of all joined rows using INNER JOIN
SELECT COUNT(*) AS inner_total
FROM countries AS c
INNER JOIN currencies AS cur
  ON c.code = cur.code;

-- Count of all joined rows including unmatched using FULL OUTER JOIN
SELECT COUNT(*) AS full_total
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code;


-- ========================================================
-- SECTION 3: Compare Output Rows Across JOIN Types
-- ========================================================

-- Retrieve rows using INNER JOIN for comparison
SELECT 
  c.name AS country, 
  cur.name AS currency
FROM countries AS c
INNER JOIN currencies AS cur
  ON c.code = cur.code
ORDER BY country;

-- Retrieve rows using LEFT JOIN
SELECT 
  c.name AS country, 
  cur.name AS currency
FROM countries AS c
LEFT JOIN currencies AS cur
  ON c.code = cur.code
ORDER BY country;

-- Retrieve rows using FULL OUTER JOIN
SELECT 
  c.name AS country, 
  cur.name AS currency
FROM countries AS c
FULL OUTER JOIN currencies AS cur
  ON c.code = cur.code
ORDER BY country;
