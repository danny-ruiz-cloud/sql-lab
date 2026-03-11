
/*
  Prompt: 
    Write a query to retrieve the top three cities 
    that have the highest number of completed trade orders listed in descending order. 
    Output the city name and the corresponding number of completed trade orders.

    get(): 
      top 3 cities { highest number of completed trades in DESC }
    output:
      city_name
      completed_trade_count
*/

SELECT 
  city, 
  COUNT(city) AS city_count -- Counts the amount of entries of said city
FROM trades t
JOIN users u
  ON t.user_id = u.user_id
WHERE status = 'Completed'
GROUP BY city
ORDER BY city_count DESC LIMIT 3


/*
This script sums up all quantities to find the city with the highest quantity of completed trades
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