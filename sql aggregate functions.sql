::: SQL Aggregate Functions :::

Data Detectives

SUM       sum of all vals in column
MIN       returns lowest val in column
MAX       returns highest val in column
AVG       calc avg of group of selected values
COUNT     counts numOfRows in specific column


COUNT 
"counts numOfRows in specific column"
  SYNTAX
    SELECT COUNT(column)
    FROM table;

  EXAMPLE
    SELECT COUNT (units_sold)
    FROM pharmacy_sales;


SUM 
"sum of all vals in column"
  SYNTAX
    SELECT SUM(column)
    FROM table;

  EXAMPLE
    SELECT SUM(spend)
    FROM product_spend;

  EXAMPLE EXERCISE
  "Output the total number of drugs manufactured by Pfizer, and output the total sales for all the Pfizer drugs"
    SELECT 
	  COUNT(drug) AS "drugs manufactured by Pfizer",
	  SUM(total_sales) AS "total sales for Pfizer"
	FROM pharmacy_sales
	WHERE manufacturer = 'Pfizer';

AVG
"computes avg val of data in column"
  SYNTAX
    SELECT AVG(column)
    FROM table;

  EXAMPLE
    SELECT AVG(spend)
    FROM product_spend;

MAX
"retrieves largest value"
  SYNTAX
    SELECT MAX(column)
    FROM table;

  EXAMPLE
    SELECT MAX(spend)
    FROM product_spend;

  EXAMPLE EXERCISE
  "Use SQL's MAX command in this practice exercise, to find the highest Netflix stock (NFLX) ever opened at."
    SELECT MAX(open)
    FROM stock_prices
    WHERE ticker = 'NFLX';
