sql trade_year


-- Arranges data by trade_year and filterse between jan2020-jan2021
  /*SELECT 
    EXTRACT(YEAR FROM date) as trade_year,
    SUM(open + close) as total_ticker_gains
  FROM stock_prices
  WHERE date >= '2020-01-01' AND date < '2021-01-01'
  GROUP BY date;
  */

-- Calculates yearly_gain organized by ticker 
-- the choice of 2 different extraction functions - EXTRACT || DATE_TRUNC
-- uses Common Table Expressions (CTEs) - WITH   
WITH cleaned_stock_prices AS (
  SELECT *,
  -- EXTRACT(YEAR FROM date) AS trade_year, -- provide a clean 'YEAR' instead of 'YYYY-MM-DD TT:TT:TT'
  -- EXTRACT(MONTH FROM date) AS trade_month
  DATE_TRUNC('year', date) AS trade_year,
  DATE_TRUNC('month', date) AS trade_month
  FROM stock_prices
)
/* Calculates monthly_gain instead of yearly
SELECT
  ticker,
  trade_month,
  SUM(close - open) AS monthly_gain
FROM cleaned_stock_prices
GROUP BY trade_month, ticker
ORDER BY trade_month;
*/
SELECT
  ticker,
  trade_year,
  SUM(close - open) AS yearly_gain
FROM cleaned_stock_prices
GROUP BY trade_year, ticker
ORDER BY ticker, trade_year;