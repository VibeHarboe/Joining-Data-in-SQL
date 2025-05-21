-- ========================================================
-- SECTION 1: CROSS JOIN - Product and Region Combinations
-- ========================================================

-- Combine all products with all regions to generate every possible pairing
-- Useful for planning, forecasting, or testing scenarios
SELECT 
    p.product_name,
    r.region_name
FROM products AS p
CROSS JOIN regions AS r
ORDER BY product_name, region_name;


-- ========================================================
-- SECTION 2: CROSS JOIN with Filter - Simulated Sales Scenarios
-- ========================================================

-- Combine products and pricing tiers to model pricing strategies
-- Filter to only high-priority products
SELECT 
    p.product_name,
    t.tier_name,
    t.discount_rate
FROM products AS p
CROSS JOIN pricing_tiers AS t
WHERE p.priority = 'high'
ORDER BY p.product_name, t.tier_name;


-- ========================================================
-- SECTION 3: CROSS JOIN for Completeness Checks
-- ========================================================

-- Use CROSS JOIN to detect missing expected combinations
-- Example: Check for missing department-location assignments
SELECT 
    d.department_name,
    l.location_name
FROM departments AS d
CROSS JOIN locations AS l
ORDER BY d.department_name, l.location_name;


-- ========================================================
-- SECTION 4: CROSS JOIN - Language Combinations Between Two Countries
-- ========================================================

-- Explore possible language-country pairings for specific historical context
SELECT 
  c.name AS country, 
  l.name AS language
FROM countries AS c        
CROSS JOIN languages AS l
WHERE c.code IN ('PAK', 'IND')
  AND l.code IN ('PAK', 'IND')
ORDER BY country, language;


-- ========================================================
-- SECTION 5: CROSS JOIN + Aggregation – Forecasting Template
-- ========================================================

-- Create a base dataset of all product-year combinations for future planning
SELECT 
  p.product_name,
  y.year,
  0 AS projected_sales
FROM products AS p
CROSS JOIN (SELECT 2024 AS year UNION ALL SELECT 2025 UNION ALL SELECT 2026) AS y
ORDER BY p.product_name, y.year;


-- ========================================================
-- SECTION 6: CROSS JOIN - Product Options Generator
-- ========================================================

-- Generate all possible combinations of colors and sizes for a product catalog
SELECT 
  color.name AS color,
  size.name AS size
FROM colors AS color
CROSS JOIN sizes AS size
ORDER BY color, size;
