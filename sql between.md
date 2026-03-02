::: SQL BETWEEN :::

BETWEEN
	selects values within a range
	MUST be paired with AND operator

	FORMAT:
		SELECT col_name1, col_name2
		FROM table_name
		WHERE col_name1 BETWEEN value1 AND value2

    Example: 
	    SELECT *
		FROM medals
		WHERE type = "GOLD"   <<< col_name1
		AND year BETWEEN 2000 AND 2010;   <<< values went here

    INCLUSIVE OR/AND aka >= and <=

    EXERCISE: 

		"Need amount of drugs sold between 100,000 units and 105,000 units
	    AND were manufactured by either Biogen, AbbVie, or Eli Lilly

		Output the manufacturer name, drug name, and the # of units sold."

			SELECT manufacturer, drug, units_sold
			FROM pharmacy_sales
			WHERE units_sold BETWEEN 100000 AND 105000 -- units
			AND (manufacturer = 'Biogen' OR manufacturer = 'AbbVie' OR manufacturer = 'Eli Lilly');