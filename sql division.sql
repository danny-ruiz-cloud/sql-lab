::: SQL Division :::

'treats result as an integer i.e. drops the decimals so 2.5 becomes 2'
  == SYNTAX ==

  SELECT expression_1 / expression_2
  FROM table;

'to divide integers and return accurate decimal results use the following:'

  CAST()
    'converts one or both operands into decimal or floats'
    == SYNTAX ==
    SELECT
      CAST(10 AS DECIMAL) / 4,
      CAST(10 AS FLOAT) / 4, 
      10 / CAST(6 AS DECIMAL),
      10 / CAST(6 AS FLOAT);

    output  output  output  output
    2.5000000000000000  2.5 1.6666666666666667  1.6666666666666667


  multiply by 1.0
    == SYNTAX ==
    SELECT
      10/6,
      10 * 1.0 / 6,
      10/6 * 1.0,
      10/(6 * 1.0)

    output  output  output  output
    1 1.6666666666666667  1.0 1.6666666666666667


  explicit typing ::
    == SYNTAX ==
      10::DECIMAL / 4,
      10::FLOAT / 4,
      10 / 4::DECIMAL,
      10 / 4::FLOAT,
      10::DECIMAL / 6,
      10::FLOAT /6

    output  output  output  output  output  output
    2.5000000000000000  2.5 2.5000000000000000  2.5 1.6666666666666667  1.6666666666666667


  Calc Percentages
    'basic formula:' (part / total) * 100
    FROM table;

    == SYNTAX ==
    SELECT
      sale_id, 
      actual_sales,
      target_sales,
      (actual_sales / target_sales) * 100 AS sales_percentage
    FROM sales;
    
