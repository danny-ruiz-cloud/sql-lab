-- 1. Import & Clean: Grab only necessary columns and filter out bad data
WITH extracted_marvel_avengers AS (
  SELECT 
    actor,
    character,
    platform,
    avg_likes
  FROM marvel_avengers
  -- NULL CHECKS
  WHERE avg_likes IS NOT NULL
  -- AND units_sold IS NOT NULL
 
),

-- 2. Aggregate: Do the math and the GROUP BY
agg_marvel_avengers AS (
  SELECT 
    actor,
    character,
    platform,
    avg_likes
  FROM extracted_marvel_avengers
  -- GROUP BY column_1
),

-- 3. Final: Apply post-aggregation business filters (e.g., HAVING or simple WHERE)
--      NULLIF the denominators
final AS (
  SELECT 
    *,
    CASE
      WHEN avg_likes >= 15000 THEN 'Super Likes'
      WHEN avg_likes BETWEEN 5000 AND 14999 THEN 'Good Likes'
      ELSE 'Low Likes'
    END AS likes_category
  FROM agg_marvel_avengers
  -- WHERE total_amount > 100
)

-- Output the final result
SELECT * FROM final ORDER BY avg_likes DESC;