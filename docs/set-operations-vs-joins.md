# Set Operations vs JOINs in SQL – What to Use When?

SQL provides two powerful toolsets to combine data: **JOINs** and **Set Operations**.
Though they both work across multiple tables, they serve distinct purposes and produce different results.

---

## 🔄 JOINs – Combine Related Data Across Tables

JOINs are used to bring together **columns** from two or more tables by matching rows based on a common key.

**Example:**

```sql
SELECT c.name, e.year, e.gdp_percapita
FROM countries AS c
JOIN economies AS e
  ON c.code = e.code;
```

**Use JOINs when:**

* You need to **combine attributes** from related entities
* You want to retrieve data from **multiple columns**
* You’re matching **foreign keys** and analyzing relationships (e.g., cities → countries)

**Types of JOINs:** `INNER`, `LEFT`, `RIGHT`, `FULL OUTER`, `SELF`, `CROSS`

---

## 🧮 Set Operations – Combine Entire Row Sets

Set operations combine **entire result sets** (rows), not just columns. They're typically used when you have two similar tables or queries and want to compare, combine, or filter results at the **row level**.

### UNION

Combines results from two queries, removing duplicates.

```sql
SELECT code, year FROM economies2015
UNION
SELECT code, year FROM economies2019;
```

### UNION ALL

Same as UNION, but **keeps duplicates**.

### INTERSECT

Returns rows that appear in **both** result sets.

```sql
SELECT code FROM populations
INTERSECT
SELECT code FROM economies;
```

### EXCEPT (or MINUS)

Returns rows from the first query **not present** in the second.

```sql
SELECT code FROM economies
EXCEPT
SELECT code FROM populations;
```

---

## 🔍 Key Differences

| Feature            | JOINs                                    | Set Operations                             |
| ------------------ | ---------------------------------------- | ------------------------------------------ |
| Combines           | Columns (horizontally)                   | Rows (vertically)                          |
| Match based on     | Foreign key / shared field               | Result sets must have same structure/order |
| Returns            | Combined columns                         | Combined rows                              |
| NULL behavior      | Depends on JOIN type                     | Preserved as in the underlying queries     |
| Use case           | Data integration & relationship analysis | Comparing datasets or merging time periods |
| Merge Type         | Combine columns                          | Stack rows                                 |
| Schema requirement | Can differ between tables                | Same column count & types                  | 
| Common use case    | Data integration & enrichment            | De-duplication, comparison                 |
| Output format      | Wider combined row                       | One column structure                       |

---

## ✅ When to Use Each

**Use JOINs when:**

* You're analyzing relationships between tables (e.g. customers + orders)
* You need data from multiple columns in related tables
* You’re aggregating or filtering based on joined data
* You need to enrich data with dimensions (e.g. country names, user attributes)
* You’re modeling relationships (1\:many, many\:many)

**Use Set Operations when:**

* You’re combining full query results (e.g. past vs current data)
* You need to check for overlaps or differences between datasets
* You want to merge time series or geographic subsets of the same schema
* You have similar data from separate sources (e.g. logs, snapshots)
* You want to compare datasets (INTERSECT / EXCEPT)
* You need to union historic vs. current records

---

## Bonus: Set Operation Inside Join

You can combine the two! Example:

```sql
WITH all_events AS (
  SELECT * FROM 2012_events
  UNION ALL
  SELECT * FROM 2016_events
)
SELECT e.event, c.city
FROM all_events e
JOIN cities c ON e.city_id = c.id;
```

---

Use both strategically – JOINs for **relational structure**, set operations for **row-level comparison and consolidation**.
