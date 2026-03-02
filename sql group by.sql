::: SQL GROUP BY :::
  "using aggregate functions for table parts"

  EXAMPLE
  "GROUP BY example that groups Amazon product sales by category:"
    SELECT
      category, 
      SUM(spend)
    FROM product_spend
    GROUP by category;

  EXAMPLE 2
    SELECT 
      ticker,
      SUM(open) as total_sales_2020
    FROM stock_prices
    WHERE date >= '2020-01-01' AND date < '2021-01-01'
    GROUP BY ticker;


  EXAMPLE 3 -- PIVOT TABLE
    SELECT 
      ticker, 
      AVG(open), 
      MAX(close)
    FROM stock_prices
    GROUP BY ticker
    ORDER BY ticker;

  EXERCISE -- Lowest opening price
  "write a SQL query to find the lowest price each stock ever opened at?"
  "Be sure to also order your results by price, in descending order."
    /*
    Find lowest_price
    foreach(stock_opening_price)
      find(lowest_price)
    */
    SELECT
      ticker,
      MIN(open) AS lowest_open
    FROM stock_prices
    GROUP BY ticker
    ORDER BY lowest_open DESC;

  
  EXERCISE -- Candidate skills (duplicates)

    ATTEMPT 1
    /*
    -- How many candidates have ea/ different skills?
    -- Sort answers based on count of candidates, highest to lowest.
    */
    /*
    WITH cleaned_canidates AS (
      SELECT *,
      candidate_id AS candidate
      FROM candidates
    )
    SELECT 
      skill AS skill_type,
      count(candidate) AS candidate_count_with_skills
    FROM cleaned_canidates
    GROUP BY skill_type;
    */

    ATTEMPT 2 -- missed the AS and the , after *
    WITH cleaned_candidates AS (
      SELECT *,
      candidate_id AS candidate
      FROM candidates
    )
    SELECT 
      skill,
      count(candidate) AS candidates_skilled_in
    FROM cleaned_candidates
    GROUP BY skill
    ORDER BY candidates_skilled_in DESC



  GROUP BY vs. ORDER BY
    ORDER BY sets data in a specific order prescribed
    GROUP BY groups data into categories

  


  EXPERIMENT 1
    WITH cleaned_stock_prices AS (
      SELECT *,
      EXTRACT(YEAR FROM date) AS trade_year
      FROM stock_prices
    )

    SELECT
      ticker,
      trade_year,
      SUM(open + close) AS total_all_ticker_gains
    FROM cleaned_stock_prices
    GROUP BY ticker, trade_year
    ORDER BY ticker, trade_year;
    -- with this method, you would EXTRACT the year from the date object
    -- use that year (trade_year) to group by 
    -- since SQL loads FROM before SELECT, we need to contain it in a WITH statement
    -- then we call the new contained table from the "main" FROM




      