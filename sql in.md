::: SQL IN :::

IN
  specifies multiple values in a single WHERE

  SYNTAX

  SELECT ...
  FROM ...
  WHERE col IN (...);


  EXAMPLE

  SELECT drug, manufacturer, units_sold
  FROM pharmacy_sales
  WHERE manufacturer IN ('Biogen', 'Bayer', 'Eli Lilly');


  EXERCISE

    which were manufactured by either Roche, Bayer, or AstraZeneca
    and did not sell between 55,000 and 550,000 units

    	SOLUTION 1:
		  	SELECT manufacturer, drug, units_sold
			FROM pharmacy_sales
			WHERE manufacturer IN ('Roche', 'Bayer', 'AstraZeneca')
			AND units_sold BETWEEN 0 AND 55000
			AND units_sold < 550000;

		SOLUTION 2: (rediscovered NOT operator)
			SELECT manufacturer, drug, units_sold
			FROM pharmacy_sales
			WHERE manufacturer IN ('Roche', 'Bayer', 'AstraZeneca')
			AND units_sold NOT BETWEEN 55000 AND 550000;

