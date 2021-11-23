-- SUBQUERIES IN THE SELECT CLAUSE

USE sql_invoicing;

SELECT
		invoice_id,
		invoice_total,
        (SELECT AVG(invoice_total)
        FROM invoices) AS invoice_avg,
        invoice_total - (SELECT invoice_avg) AS difference
FROM invoices;

-- Exercise : write a query to produce this result > client_id, name, total_sales, average, difference

USE sql_invoicing;

SELECT 
		client_id,
		name, 
		(SELECT SUM(invoice_total)
		FROM invoices
        WHERE client_id = c.client_id) AS total_sales,
		(SELECT AVG(invoice_total)
		FROM invoices) AS average,
        (SELECT total_Sales - average) AS difference
FROM clients c;