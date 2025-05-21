-- ############################################################
-- SELF JOIN examples showcasing organizational hierarchies
-- and time-based population comparisons with advanced analysis
-- ############################################################

-- ========================================================
-- SECTION 1: SELF JOIN - Employees and Managers
-- ========================================================

-- Join the employees table to itself to match each employee with their manager
-- Assumes a table structure where each employee has a manager_id referencing another employee_id
SELECT 
    e.employee_id,
    e.name AS employee_name,
    m.name AS manager_name
FROM employees AS e
LEFT JOIN employees AS m
  ON e.manager_id = m.employee_id
ORDER BY manager_name, employee_name;


-- ========================================================
-- SECTION 2: SELF JOIN - Team Hierarchies by Department
-- ========================================================

-- Group employees and their managers within departments
-- Useful to trace reporting structures in organizational units
SELECT 
    e.name AS employee,
    m.name AS manager,
    e.department
FROM employees AS e
LEFT JOIN employees AS m
  ON e.manager_id = m.employee_id
ORDER BY e.department, manager, employee;


-- ========================================================
-- SECTION 3: SELF JOIN - Comparing Population Growth Over Time
-- ========================================================

-- Join populations table to itself to compare values across different years
-- This example compares population size in 2010 and 2015 for each country
SELECT 
    p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015
FROM populations AS p1
INNER JOIN populations AS p2
  ON p1.country_code = p2.country_code
WHERE p1.year = 2010
  AND p1.year = p2.year - 5;


-- ========================================================
-- SECTION 4: SELF JOIN - Calculating Population Growth Percentage
-- ========================================================

-- Extend previous join to calculate percent change in population from 2010 to 2015
SELECT 
    p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015,
    ROUND(((p2.size - p1.size) / p1.size) * 100, 2) AS percent_growth
FROM populations AS p1
INNER JOIN populations AS p2
  ON p1.country_code = p2.country_code
WHERE p1.year = 2010
  AND p1.year = p2.year - 5;


-- ========================================================
-- SECTION 5: SELF JOIN - Countries Above Average Population Growth
-- ========================================================

-- Filter to only show countries where the population growth exceeds global average
WITH growth_data AS (
  SELECT 
    p1.country_code, 
    p1.size AS size2010, 
    p2.size AS size2015,
    ROUND(((p2.size - p1.size) / p1.size) * 100, 2) AS percent_growth
  FROM populations AS p1
  INNER JOIN populations AS p2
    ON p1.country_code = p2.country_code
  WHERE p1.year = 2010
    AND p1.year = p2.year - 5
),
average_growth AS (
  SELECT AVG(percent_growth) AS avg_growth
  FROM growth_data
)
SELECT 
  g.country_code,
  g.size2010,
  g.size2015,
  g.percent_growth,
  a.avg_growth
FROM growth_data AS g, average_growth AS a
WHERE g.percent_growth > a.avg_growth
ORDER BY g.percent_growth DESC;
