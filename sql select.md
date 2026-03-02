::: SQL SELECT :::


SELECT 
	tells the db >> "i want to output data from the specific column names x, y, z"
    x, y, x will be your variables

FROM 
	tells the db >> "i want the data from the 'alpha' table"
    alpha in the example above will be "reviews"
    "look at the reviews table, that one, pull data from that table"

    EXAMPLES	
	  SELECT review_id, user_id, stars
	  FROM reviews;

	  SELECT * FROM reviews;

	  SELECT
	    user_id,
	    product_id,
	    stars
	  FROM reviews;

SQL Trailing Commas ERROR
	SELECT review_id, user_id,  <<<< bad comma
	FROM reviews;

WILDCARD data pulling
	SELECT *
	FROM <table_name>;

	SELECT * 
	FROM reviews;

	pulls all cols from table reviews
	good for when you can't remember or know the cols





