-- natural join
-- natural joins are not recommended to avoid because it may sometime produce the strange results
-- in natural join we do not specify the column name it automatically detects the common table and produces the result
USE sql_store;

SELECT 
o.order_id,
c.first_name
FROM orders o
NATURAL JOIN customers c;
