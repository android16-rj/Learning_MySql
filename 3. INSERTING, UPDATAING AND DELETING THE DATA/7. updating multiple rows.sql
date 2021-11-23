-- updating multiple rows

UPDATE invoices
SET payment_total = invoice_total * 50/100,
payment_date = due_date
WHERE client_id = 3;

-- write a sql statement to 
--  any customer born before 1990 extra 50 points

USE sql_store;

UPDATE customers
SET points = points + 50
WHERE birth_date < '1990-01-01';