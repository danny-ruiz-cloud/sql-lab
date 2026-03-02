::: SQL AND, OR, NOT :::

AND 
    displays a record if ALL conditions are TRUE
    sel ROWs that satisfies (2) conditions

    Example:
	    SELECT *
		FROM reviews
		WHERE product_id = 50001
		AND stars > 3;

	Multiple ANDs
	    SELECT *
	    FROM reviews
	    WHERE product_id != 50001
	    AND stars > 3
	    AND stars < 5;
OR 
    allows to select a ROW that satifies ANY conditions
    contrasted with AND which requires BOTH conditions satisfied

    Example: 
	    SELECT *
		FROM reviews
		WHERE stars > 3
		OR product_id = 50001;

	Multiple ORs
		SELECT *
		FROM reviews
		WHERE (stars = 3 OR stars = 4)
		AND review_id > 5000;

		all product reviews with 3 or 4 stars, AND make sure the review_id is greater than 5000

NOT
    displays a record if the specific condition is FALSE

    Example:
	    SELECT * FROM reviews
	    WHERE NOT stars = 5;