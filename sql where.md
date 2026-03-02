::: SQL WHERE :::

WHERE 
    output specific ROWS 
    basically what SELECT is for Columns, WHERE is for Rows

PostgreSQL 14 seems to like WHERE below FROM; throws syntax errors if reversed

    SELECT *
    FROM reviews
    WHERE stars > 3;

Multiple Conditions

    SELECT *
    FROM table
    WHERE condition1
      AND condition2
      AND condition3;

    SELECT *
    FROM reviews
    WHERE stars > 2
      AND user_id = 362
      OR user_id = 281; --this line will not display as user_id 281 has 2 stars

Logical Operators we may not know
    =        equals to
    !=, <>   not equals to
