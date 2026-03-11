/*
SELECT 
  city,
  SUM(t.quantity) AS completed_trade_count
FROM trades t
JOIN users u
  ON t.user_id = u.user_id
-- GROUP BY status
WHERE status = 'Completed'
GROUP BY city
ORDER BY completed_trade_count DESC LIMIT 3;
*/
/*
  get(): 
    top 3 cities { highest number of completed trades in DESC }
  output:
    city_name
    completed_trade_count
    
    
SELECT DISTINCT ON (status)
  order_id,
  status,
  user_id
*/

SELECT 
  city, 
  COUNT(city) AS city_count
FROM trades t
JOIN users u
  ON t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY city_count DESC LIMIT 3
