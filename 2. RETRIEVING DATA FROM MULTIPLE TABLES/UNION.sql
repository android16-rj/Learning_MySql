-- unions

-- using joins we combined the columns from multiple tables
--  in sql we can combine rows to, and this is powerful

-- demonstration : there order placed in the current year and previous year
-- we gonna label the orders, order placed in current year as Active and orders placed in previous year as Archived

SELECT 
order_id,
order_date,
'Active' AS status
FROM orders 
WHERE order_date >= '2019-01-01' -- this querry returned Active orders
UNION  -- now we have the unions clause to combine both the querries, AND WE HAVE THE RESULTS OF BOTH THE QUERRIES
SELECT 
order_id,
order_date,
'Archived' AS status
FROM orders 
WHERE order_date <='2019-01-01'; -- this querry returned the archived orders

-- write the querry to return this result
-- cols customer_id, first_name, points, type  /<2000 points bronze , 2000- 3000 silver, >3000 gold
-- sorted the result by first name

SELECT 
customer_id,
first_name,
points,
'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT 
customer_id,
first_name,
points,
'Silver' AS type
FROM customers
WHERE points > 2000 AND points < 3000 -- we can use points BETWEEN 2000 AND 3000
UNION
SELECT 
customer_id,
first_name,
points,
'Gold' AS type
FROM customers
WHERE points > 3000
ORDER BY first_name;
