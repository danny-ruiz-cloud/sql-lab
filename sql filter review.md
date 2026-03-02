::: SQL FILTERING REVIEW :::


WHERE
  filters rows based on conditions
  WHERE user_id = 2

AND / OR
  combine multiple filtering conditions
  WHERE user_id = 2 OR user_id = 3

BETWEEN
  filters on a range of values
  WHERE user_id BETWEEN 2 AND 4

IN
  list of values to filter on
  WHERE user_id IN ('222','3333','434')

LIKE
  match value against a pattern
  WHERE user_id LIKE 'ent-%'



exercise:

Write a SQL query to find all customers who are between the ages of 18 and 22 (inclusive), live in either Victoria, Tasmania, Queensland, their gender isn't "n/a", and their name starts with either 'A' or 'B'.

FIND
  all customers
    ages       = [18-22]
    livesIn    = [Victoria, Tasmania, Queensland]
    gender    != 'n/a'
    nameStart  = 'A' OR 'B'


SOLUTION
	SELECT * 
	FROM customers
	WHERE age BETWEEN 18 AND 22
	AND state IN ('Victoria', 'Tasmania', 'Queensland')
	AND gender NOT LIKE 'n/a'
	AND (customer_name LIKE 'A%' OR customer_name LIKE 'B%');
	-- AND customer_name SIMILAR TO '(A|B)%'; -- adv solution
