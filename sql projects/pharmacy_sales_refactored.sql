EXTENDED CEIL PRACTICE: Refactored for Additional Cases

/* ADDITIONAL CASES
-- Clean for duplicate/case mixed drugs
-- Check for null
-- Check for div by 0 
-- GROUP similar drugs for totals
-- count how many dupes

Clean > Group by man, drug
Should be able to order outside of the CTEs
*/ 

-- 1. Import & Clean: Grab only necessary columns and filter out bad data
WITH extracted_pharmacy_sales AS (
  SELECT 
    TRIM(LOWER(manufacturer)) AS manufacturer,
    LOWER(drug) as drug, 
    total_sales,
    units_sold
  FROM pharmacy_sales 
  -- Null Checks
  WHERE total_sales IS NOT NULL
  AND units_sold IS NOT NULL
),

-- 2. Aggregate: Do the math and the GROUP BY
agg_pharmacy_sales AS (
  SELECT  
    manufacturer,
    drug, 
    SUM(total_sales) AS agg_total_sales,
    SUM(units_sold) AS agg_units_sold
  FROM extracted_pharmacy_sales
  GROUP BY manufacturer, drug
  -- ORDER BY drug
),

-- 3. Final: Apply post-aggregation business filters (e.g., HAVING or simple WHERE)
final AS (
  SELECT 
    INITCAP(manufacturer) AS manufacturer,
    INITCAP(drug) AS drug, 
    CEIL(agg_total_sales / NULLIF(agg_units_sold, 0)) AS unit_cost
  FROM agg_pharmacy_sales
)

-- Output the final result
SELECT * 
--  drug,
--  unit_cost
FROM final WHERE manufacturer = 'Merck' 
ORDER BY unit_cost;




