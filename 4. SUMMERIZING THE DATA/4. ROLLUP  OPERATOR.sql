-- THE ROLLUP CLAUSE
-- the ROLLUP is used for sum for categories specified in group by clause
-- ROLLUP is only part of mysql , it is not available in the standard sqls.

USE sql_invoicing;
SELECT 
	client_id,
    SUM(invoice_total) AS total_Sales
FROM invoices
GROUP BY client_id WITH ROLLUP;


SELECT 
	state,
    city,
    SUM(invoice_total) AS total_Sales
FROM invoices
JOIN clients c 
USING(client_id)
GROUP BY state, city WITH ROLLUP; -- now we get total sales for san fransico, CA, ie got sum of sales state and citywise subsequently


-- exercise: write a querry to produce,  payment method  total, write querruies against the payments table

SELECT 
	pm.name AS payment_methods,
    SUM(p.amount) AS  total
FROM payments p
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id
GROUP BY pm.name with ROLLUP;  -- WE CANNOT USE ALIAS