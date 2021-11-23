-- HAVING CLAUSE

SELECT 
client_id,
SUM(invoice_total) AS total_sales
FROM invoices
GROUP BY client_id;

-- if we want to include the clients having total_sales more than 500
-- we cannot use the WHERE clause because we have grouped by client_id at the last 
-- so here we use HAVING clause
SELECT 
client_id,
SUM(invoice_total) AS total_sales
FROM invoices
GROUP BY client_id
HAVING total_sales > 500;

-- with WHERE clause we can filter data before group
-- with HAVING clause we can filter data after group

SELECT 
client_id,
SUM(invoice_total) AS total_sales,
COUNT(*) AS no_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales > 500;

-- FIND THE CLIENTS HAVING SALES MORE THAN 500 AND INVOICES MORE THAN 5
SELECT 
client_id,
SUM(invoice_total) AS total_sales,
COUNT(*) AS no_of_invoices
FROM invoices
GROUP BY client_id
HAVING total_sales > 500 AND no_of_invoices >5; -- we cannot take columns which is not included in select statement, this is diff between WHERE and Having clause 

-- exercise: get the customers 
   -- located in VA 
   -- who have spent more than 100 $
   
USE sql_store;

SELECT 
o.customer_id,
c.first_name,
c.last_name,
c.state,
SUM(oi.quantity * oi.unit_price) AS amount
FROM orders O
LEFT JOIN customers c
USING (customer_id)
LEFT JOIN order_items oi
USING (order_id)
GROUP BY
o.customer_id,
c.first_name,    -- AS A RULE OF THUMB WE SHOULD GROUP BY ALL THE COLs SELECTED IN THE SELECT CLAUSE
c.last_name
HAVING c.state = 'VA' AND amount > 100;


 
SELECT * 
FROM customers
HAVING state = 'VA'

