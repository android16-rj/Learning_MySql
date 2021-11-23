-- joining more than two tables while writing thr query

USE sql_store;
SELECT *
from orders; -- order_id,status, customer_id, order_date

SELECT * 
FROM customers; -- first_name , last_name 

SELECT *
FROM order_statuses; -- name ,order_status_id

SELECT o.order_id,
o.customer_id,
c.first_name, 
c.last_name, 
o.order_date,
os.name
FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
JOIN order_statuses os
ON o.status = os.order_status_id;

-- exercise sql_invoicing DBs in payments table there is payment made by client for each invoice 
-- create the querry that will show the client name payment method
USE sql_invoicing;

SELECT 
p.invoice_id,
p.amount AS "Invoice Amount",
i.invoice_date,
p.payment_id,
c.name AS "Client Name",
pm.name AS "Payment Method"
FROM payments p
JOIN clients c 
ON p.client_id = c.client_id
JOIN invoices i
ON p.invoice_id = i.invoice_id
JOIN payment_methods pm
ON p.payment_method = pm.payment_method_id;

