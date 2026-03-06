SQL CTE boilerplate

-- 1. Import: Grab only the columns we need from the raw table
WITH raw_table_name AS (
  SELECT * FROM table_name
),

-- 2. Clean: Filter out any bad/missing data before doing math
cleaned_table_name AS (
  SELECT * FROM raw_table_name
  -- WHERE target_column IS NOT NULL
),

-- 3. Aggregate: Do the math and the GROUP BY
agg_table_name AS (
  SELECT * FROM cleaned_table_name
  -- GROUP BY column
),

-- 4. Final: Apply business filters (like > 100)
final AS (
  SELECT * FROM aggregated_table_name
)

-- Output the final result
SELECT * FROM final;



----

simpler version for minimal cleaning or smaller tables

-- 1. Import & Clean: Grab only necessary columns and filter out bad data
WITH extracted_table AS (
  SELECT 
    column_1, 
    column_2
  FROM raw_table_name
  /* NULL CHECKS
  -- WHERE total_sales IS NOT NULL
  -- AND units_sold IS NOT NULL
  */
),

-- 2. Aggregate: Do the math and the agg functions
-- (e.g., HAVING / GROUP )
agg_table AS (
  SELECT 
    column_1
    -- SUM(column_2) AS total_amount
  FROM extracted_table
  -- GROUP BY column_1
),

-- 3. Final: Apply post-aggregation business filters WHERE)
--      NULLIF the denominators
final AS (
  SELECT * FROM agg_table
  -- WHERE total_amount > 100
)

-- Output the final result
SELECT * FROM final;




