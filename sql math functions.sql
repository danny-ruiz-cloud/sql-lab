::: SQL Math Functions :::

ABS()
  'Calc absolute differences'

  == SYNTAX ==

  SELECT
    date,
    ticker,
    (close-open) AS difference,
    ABS(close-open) AS abs_difference
  FROM stock_prices
  WHERE EXTRACT(YEAR FROM date) = 2023
    AND ticker = 'GOOG';


ROUND()
  'Rounding numbers to specified decimal places'

  == SYNTAX ==

  SELECT
    ticker,
    AVG(close) AS avg_close,
    ROUND(AVG(close), 2) AS rounded_avg_close
  FROM stock_prices
  WHERE EXTRACT(YEAR FROM date) = 2022
  GROUP BY ticker;


CEIL() and FLOOR(): 
  'round up and down'

  == SYNTAX ==

  SELECT
    date,
    ticker,
    high,
    CEIL(high) AS resistance_level,
    low,
    FLOOR(low) AS support_level
  FROM stock_prices
  WHERE ticker = 'META'
  ORDER BY date;


POWER():
  'Calc squared values'
  'PostgreSQL == ^'
  == SYNTAX ==

  SELECT
    date,
    ticker,
    close,
    ROUND(POWER(close, 2), 2) AS squared_close
  FROM stock_prices
  WHERE ticker IN ('APPL', 'GOOG', 'MSFT')
  ORDER BY date;


MOD() or %
  'check if divisible by num, returns remainder'

== SYNTAX ==

SELECT
  ticker,
  close,
  MOD(close, 5) AS price_remainder_mod,
  close%5 AS price_remainder_modulo
FROM stock_prices
WHERE ticker = 'GOOG'




EXERCISE - CEIL PRACTICE

-- 1. Import & Clean: Grab only necessary columns and filter out bad data
WITH extracted_pharmacy_sales AS (
  SELECT 
    manufacturer,
    drug, 
    total_sales,
    units_sold
  FROM pharmacy_sales 
  -- WHERE target_column IS NOT NULL
),

-- 2. Aggregate: Do the math and the GROUP BY
agg_pharmacy_sales AS (
  SELECT  
    manufacturer,
    drug, 
    total_sales,
    units_sold
  FROM extracted_pharmacy_sales
  WHERE manufacturer = 'Merck'
  -- GROUP BY drug
  ORDER BY drug
  
),

-- 3. Final: Apply post-aggregation business filters (e.g., HAVING or simple WHERE)
final AS (
  SELECT 
    drug, 
    CEIL(total_sales / units_sold) AS unit_cost
  FROM agg_pharmacy_sales
  -- WHERE total_amount > 100
)

-- Output the final result
SELECT * FROM final ORDER BY unit_cost;
-- SELECT * FROM agg_pharmacy_sales

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




