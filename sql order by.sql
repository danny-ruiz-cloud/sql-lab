::: SQL ORDER BY :::

ORDER BY
  "the lord's sort button!"
  
  SYNTAX
    SELECT col1, col2
    FROM table_name
    WHERE condition(s)
    ORDER BY column_choice;


  EXAMPLE
    "table of medicines, and how well they sold at CVS Pharmacy."
    SELECT * FROM pharmacy_sales -- unordered mess

    SELECT product_id, drug, units_sold
    FROM pharmacy_sales
    ORDER BY drug;

  EXAMPLE 2
    SELECT total_sales, manufacturer, drug
    FROM pharmacy_sales
    ORDER BY total_sales, manufacturer;

DESC
	SYNTAX
    SELECT col1, col2
    FROM table_name
    WHERE condition(s)
    ORDER BY column_choice DESC; <<< arranges by descending order

Muli-column sorting
  just add an addition col after the original ORDER BY <col name>
  first col takes precedence over all others
  when ties happen, it will choose the first of the two

ORDER BY Numbers, Not Column Names
  supposed to be "pro-tip" but seems annoyingly vague
  SELECT policy_holder_id, call_category, call_received
  FROM callers
  ORDER BY 1,3 DESC; <<<<


LIMIT 
  limits output by record

  SYNTAX
    SELECT *
    FROM callers
    ORDER BY call_received DESC
    LIMIT 5;


OFFSET
  skips whatever specified, so, OFFSET 10 will skip the first 10 randomly pulled data records

  SYNTAX
    SELECT *
    FROM callers
    ORDER BY calls_received DESC
    OFFSET 10
    LIMIT 5;





  

















Experimenting with CASE and WITH

	WITH formatted_pharmacy_sales AS (
	  SELECT 
	    -- drug AS original_name,
	    INITCAP(drug) AS "drug_name",
	    manufacturer,
	    total_sales,
	    units_sold
	  FROM pharmacy_sales 
	  WHERE drug ILIKE '%hydro%'
	  -- ORDER BY drug, total_sales DESC, units_sold, manufacturer;
	)
	SELECT * 
	FROM formatted_pharmacy_sales
	ORDER BY 
	  (CASE WHEN "drug_name" ILIKE '%hydrochloride%' THEN 0 ELSE 1 END) ASC,
	  "drug_name" ASC;