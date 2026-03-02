::: SQL Arithmetic :::
'math expressions to transform column values'
  EXAMPLE
    SELECT particle_speed / 10.0 + speed_offset
    FROM particle_sensor_data
    WHERE (particle_position ^ 2) * 10.0 > 500
    AND sensor_type = 'photon'
    AND measurement_day % 7 = 0;

SQL Addition +
  SELECT salary + bonus AS total_compensation FROM employees;

SQL Subtraction -
  SELECT revenue - expenses AS profit FROM product_sales;

SQL Multiplication *
  SELECT units_sold * price AS revenue FROM ecomm_orders;

SQL Division /
  / operator divides the 1st col by the num in the 2nd col
  SELECT country_gdp / population AS gpd_per_capita FROM econ_stats;

SQL Modulus %
  same as other programming languages
  SELECT 23 % 6; -- returns 5 
  like other languages, you can use this to filter out odds and evens
  SELECT * 
  FROM measurements
  WHERE measurements_num % 2 = 1
  -- remainder 1 = odd
  -- remainder 0 = even, because it divides evenly

SQL Exponentiation (^)
  SELECT 10 ^ 2;

SQL Arithmetic Order of Operations
  PEMDAS
    P: Parentheses first
    E: Exponents (ie. ^)
    MD: Multiplication and Division (left-to-right)
    AS: Addition and Subtraction (left-to-right)

-----------------
EXERCISE - CVS Interview Question 
-----------------
Version 1:
-- 1. Import: Grab only the columns we need from the raw table
WITH raw_pharmacy_sales AS (
  SELECT 
    drug,
    cogs,
    total_sales
  FROM pharmacy_sales 
),

-- 2. Clean: Filter out any bad/missing data before doing math
cleaned_pharmacy_sales AS (
  SELECT 
    drug AS drug_name,
    SUM(cogs) AS total_cogs,
    SUM(total_sales) AS final_sales
  FROM raw_pharmacy_sales
  GROUP BY drug
  -- WHERE target_column IS NOT NULL
),

-- 3. Aggregate: Do the math and the GROUP BY
-- profit = total_sales - cogs
agg_pharmacy_sales AS (
  SELECT 
    drug_name, 
    final_sales - total_cogs AS profit
  FROM cleaned_pharmacy_sales
  -- GROUP BY column
),

-- 4. Final: Apply business filters (like > 100)
final AS (
  SELECT 
    drug_name,
    profit
  FROM agg_pharmacy_sales
)

-- Output the final result
SELECT * FROM final ORDER BY profit DESC LIMIT 3;

-----------------
EXERCISE - JPMorgan Interview Question 
-----------------
-- 1. Import: Grab only the columns we need from the raw table
WITH raw_monthly_cards_issued AS (
  SELECT 
    card_name, 
    issued_amount, 
    issue_month,
    issue_year
  FROM monthly_cards_issued
),

-- 2. Clean: Filter out any bad/missing data before doing math
cleaned_monthly_cards_issued AS (
  SELECT     
    card_name, 
    issued_amount, 
    issue_month,
    issue_year 
  FROM raw_monthly_cards_issued
  WHERE issued_amount IS NOT NULL
),

-- 3. Aggregate: Do the math and the GROUP BY
agg_monthly_cards_issued AS (
  SELECT
    card_name, 
    MIN(issued_amount) AS lowest_issue_amount,
    MAX(issued_amount) AS highest_issue_amount
  FROM cleaned_monthly_cards_issued
  GROUP BY card_name
),

-- 4. Final: Apply business filters (like > 100)
final AS (
  SELECT 
  card_name,
  highest_issue_amount - lowest_issue_amount AS difference
  FROM agg_monthly_cards_issued
)

-- Output the final result
SELECT * FROM final ORDER BY difference DESC;

-----------------
EXERCISE - Big-Mover Interview Question 
-----------------
-- 1. Import & Clean: Grab only necessary columns and filter out bad data
WITH extracted_stock_prices AS (
  SELECT 
    ticker, 
    date,
    open,
    close
  FROM stock_prices 
  -- WHERE target_column IS NOT NULL
),

-- 2. Aggregate: Do the math and the GROUP BY
agg_stock_prices AS (
  SELECT 
    ticker, 
    date,
    ((SUM(open) - SUM(close)) / NULLIF(SUM(open), 0)*100) AS percentage_change
  FROM extracted_stock_prices
  GROUP BY ticker, date
),

-- 3. Final: Apply post-aggregation business filters (e.g., HAVING or simple WHERE)
final AS (
  SELECT 
    ticker,
    COUNT(percentage_change) AS big_movers
  FROM agg_stock_prices
  WHERE ABS(percentage_change) > 10
  GROUP BY ticker
)

-- Output the final result
SELECT * FROM final ORDER BY big_movers DESC;
