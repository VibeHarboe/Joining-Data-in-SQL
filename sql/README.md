# SQL Join Exercises – Portfolio Showcase

This folder contains a collection of advanced SQL join exercises based on real-world business and analytics scenarios. Each file is structured into clearly labeled sections with use cases ranging from operational hierarchies to business-critical analysis.


## 📄 SQL Files

- [01_inner_join.sql](01_inner_join.sql) – INNER JOIN examples combining geographic, economic, and language data  
- [02_left_right_join.sql](02_left_right_join.sql) – LEFT and RIGHT JOIN use cases for inclusive joins and join equivalency 
- [03_full_join.sql](03_full_join.sql) – FULL OUTER JOIN examples to analyze unmatched data and join coverage
- [04_self_join.sql](04_self_join.sql) – SELF JOIN queries to compare hierarchies and time-based changes
- [05_cross_join.sql](05_cross_join.sql) – CROSS JOIN queries to generate combinations and validate data completeness
- [06_join_missing.sql](06_join_missing.sql) – Using JOINs to identify unmatched or missing records  
- [07_join_comparison.sql](07_join_comparison.sql) – Comparison of INNER vs. OUTER JOIN results in multi-table scenarios  


## 📄 SQL Files Overview

* **01\_inner\_join.sql** – INNER JOIN examples combining geographic, economic, and language data:

  * Link cities with countries to analyze regional characteristics
  * Join countries with economies and languages to retrieve contextual information
  * Combine three tables to compare fertility and unemployment rates across years

* **02\_left\_right\_join.sql** – LEFT and RIGHT JOIN use cases for inclusive joins and join equivalency:

  * Retrieve cities even when country data is missing
  * Aggregate GDP per region using LEFT JOIN with GROUP BY
  * Identify unmatched records using IS NULL
  * Demonstrate RIGHT JOIN equivalency by reversing LEFT JOIN logic

* **03\_full\_join.sql** – FULL OUTER JOIN examples to analyze unmatched data, classify match status, and explore regional relationships:

  * Identify missing matches between countries and currencies
  * Count and classify join results using CASE and aggregation
  * Chain FULL OUTER JOINs across multiple dimensions (e.g., languages, currencies)

* **04\_self\_join.sql** – SELF JOIN examples showcasing organizational hierarchies and time-based population comparison:

  * Link employees to their managers across departments
  * Compare population data for the same country across two time periods
  * Calculate and filter countries by population growth using CTEs

* **05\_cross\_join.sql** – CROSS JOIN queries to generate combinations and validate data completeness:

  * Generate all combinations between products and regions
  * Simulate pricing strategies across tiers
  * Detect missing expected pairings (e.g., department-location coverage)
  * Explore possible language-country pairings in historical context

* **06\_join\_missing.sql** – Using JOINs to identify unmatched or missing records:

  * Detect countries without currency entries and vice versa
  * Highlight year-specific gaps using LEFT JOIN with filter conditions
  * Use FULL OUTER JOINs for mismatch detection across entire tables

* **07\_join\_comparison.sql** – Comparative JOINs to evaluate INNER, LEFT, and FULL OUTER JOIN behaviors:

  * Compare row counts and result differences across join types
  * Analyze dataset completeness and exclusivity based on join logic
