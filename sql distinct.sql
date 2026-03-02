::: SQL DISTINCT :::
'used with SELECT to return unique values'

  SYNTAX
    SELECT DISTINCT manufacturer
    FROM pharmacy_sales;

'multiple columns need only one DISTINCT
will return the DISTINCT product of both columns'
  
  EXAMPLE
    SELECT DISTINCT user_id, status
    FROM trades
    ORDER BY user_id;

'you can also use aggregrate functions with DISCTINCT'
  EXAMPLE
    SELECT COUNT(DISTINCT user_id)
    FROM trades;

  EXERCISE 1 - unique products
  'Write a query using COUNT DISTINCT to identify the number of unique products within each product category.'
    SELECT category, COUNT(DISTINCT product)
    FROM product_spend
    GROUP BY category


  EXERCISE 1 - with CTE

  WITH raw_data AS (
    SELECT category, product FROM product_spend
  ),
  cleaned_product_spend AS (
    SELECT category, product 
    FROM raw_data
    WHERE product IS NOT NULL
  ),
  aggregated_product_spend AS (
    SELECT category, 
    COUNT(DISTINCT product) AS count_of_unique_products
    FROM cleaned_product_spend
    GROUP BY category
  ),
  final_output AS (
    SELECT category, count_of_unique_products 
    FROM aggregated_product_spend
  )
  SELECT * FROM final_output;