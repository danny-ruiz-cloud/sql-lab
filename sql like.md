::: SQL LIKE :::

LIKE // NOT LIKE
	filter rows based on string matching
	CASE SENSITIVE | use ILIKE for insensitive queries

SYNTAX
	SELECT ...
	FROM ...
	WHERE col LIKE ...
	  AND/OR col NOT LIKE ...;

wildcards: 
   %    0 or multiple chars  (seems case sensitive)
   		  ex: %relief%
   		  tells database any chars before %word% and after
   _    single char



query table:
Example in Query	             Definition
WHERE first_name LIKE 'a%'	     Finds any values that starts with "a"
WHERE first_name LIKE '%a'	     Finds any values that ends with "a"
WHERE first_name LIKE '%ae%'	 Finds any values that have "ae" in the middle
WHERE first_name LIKE '\_b%'	 Finds any values with "b" in the second position
WHERE first_name LIKE 'a%o'	     Finds any values that starts with "a" and ends with "o"
WHERE first_name LIKE 'a___'	 Finds any value that starts with "a" and has 3 characters


EXAMPLE 1:
"Find all customers whose first name starts with "F" and the last letter in their last name is "ck"."

	SELECT *
	FROM customers
	WHERE customer_name LIKE 'F%ck';


EXAMPLE 2: 
"Find all customers where the 2nd and 3rd letter in their name is "e"."

	SELECT * FROM customers
	WHERE customer_name LIKE '_ee%';