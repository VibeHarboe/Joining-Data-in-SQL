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
