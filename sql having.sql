::: SQL HAVING :::

HAVING
  allows filtering data based on values from aggregate functions
    values aggregated from groups of rows
    values AFTER grouping
  differs from WHERE which filters values based on individual rows
    values BEFORE grouping

  HAVING is used when you are filtering during the grouping process.
  WHERE is used when you are filtering a table that is already finished

  SYNTAX
    SELECT
      ticker,
      AVG(open)
    FROM stock_prices
    GROUP BY ticker
    HAVING AVG(open) > 200;

  Can also filter for multiple conditions like WHERE
    HAVING AVG(open) > 200 AND MIN(open) > 100;

  Recommended SQL order
  
    SELECT
    FROM
    WHERE
    GROUP BY
    HAVING
    ORDER BY


  EXERCISE 1 - first attempt && raw SQL
  "find all FAANG stocks whose open share price was always greater than $100."
    -- CTE
    /*
    WITH cleaned_stock_prices AS (
      SELECT
        ticker, 
        MIN(open) AS lowest_opening_price
      FROM stock_prices
      GROUP BY ticker
    )
    SELECT 
      ticker,
      lowest_opening_price
    FROM cleaned_stock_prices
    WHERE lowest_opening_price > 100;
    */

    -- raw SQL
    SELECT
      ticker,
      MIN(open)
    FROM stock_prices
    GROUP BY ticker
    HAVING MIN(open) > 100;

  EXERCISE 1 - FULL CTE dbt edition
    -- 1. Import: Grab only the columns we need from the raw table
    WITH raw_stonks AS (
      SELECT 
        ticker,
        open
      FROM stock_prices
    ),

    -- 2. Clean: Filter out any bad/missing data before doing math
    cleaned_stonks AS (
      SELECT
        ticker,
        open
      FROM raw_stonks
      -- WHERE open IS NOT NULL -- A classic "cleaning" step
    ),

    -- 3. Aggregate: Do the math and the GROUP BY
    aggregated_stonks AS (
      SELECT
        ticker,
        MIN(open) AS lowest_stonk_opens
      FROM cleaned_stonks
      GROUP BY ticker
    ),

    -- 4. Final: Apply business filters (like > 100)
    final_output AS (
      SELECT 
        ticker,
        lowest_stonk_opens
      FROM aggregated_stonks
      WHERE lowest_stonk_opens > 100
    )
    -- Output the final result
    SELECT * FROM final_output;

  EXERCISE 2 -- Candidate check for more than two skills.

    WITH raw_data AS (
    SELECT
      candidate_id,
      skill
    FROM candidates
    ),
    cleaned_data AS (
      SELECT
        candidate_id AS candidate,
        skill
      FROM raw_data
      -- WHERE open IS NOT NULL -- A classic "cleaning" step
    ),
    aggregated_data AS (
      SELECT
        candidate,
        COUNT(skill) AS skill_count
      FROM cleaned_data
      GROUP BY candidate
    ),
    final_result AS (
      SELECT
        candidate
        -- skill_count
      FROM aggregated_data
      WHERE skill_count > 2
    )
    SELECT * FROM final_result;
    -- SELECT * FROM candidates;

  EXERCISE 'SQL HAVING LinkedIn Interview Question'
    WITH raw_data AS (
      SELECT
        candidate_id,
        skill
      FROM candidates
    ),
    cleaned_data AS (
      SELECT 
        candidate_id AS candidate,
        skill
      FROM raw_data
      WHERE skill IS NOT NULL -- A classic "cleaning" step
      AND skill IN ('Python', 'Tableau', 'PostgreSQL')
    ),
    aggregated_data AS (
      SELECT 
        candidate,
        COUNT(skill) AS skill_count
      FROM cleaned_data
      GROUP BY candidate
    ),
    final_result AS (
      SELECT 
       candidate
       -- skill_count
    -- When candidate == Python, Tableau, PostgreSQL
          -- output
      FROM aggregated_data
      WHERE skill_count = 3
    )

    SELECT * FROM final_result ORDER BY candidate;

