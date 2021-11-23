-- creating the copy of the table
-- for eg. currently orders table have dozens of records 
-- now lets say we gonna create the copy of the table and call it as orders_archived

CREATE TABLE orders_archived AS
SELECT * FROM orders;  -- we have coppied the table

-- we used SELECT statement to do so, we can use subquerries and it is a powerful tool,
-- so lets truncate the table just copied in above querry and now all the records in the table are deleted.

-- now we want to copy subset of records in the orders_archived table from order table eg all the records of orders placed before 2019.

INSERT INTO orders_archived
SELECT *
FROM orders 
WHERE order_date < '2019-01-01';

-- exercise : in sql_invoicing database in invoice table,  create copy of the table and put them in your table ie invoices_archived
-- however in that table in client_id table we need client name table so we need to join this table with clients table (use subquerry) 
-- also to make this exercise interesting get the orders which have payment date

USE sql_invoicing; -- using sql_invoicing database

CREATE TABLE invoicing_archived AS
SELECT
i.invoice_id,
i.number,
c.name AS client_name,
i.invoice_total,
i.payment_total,
i.invoice_date,
i.payment_date,
i.due_date	
FROM invoices i
LEFT JOIN clients c
USING (client_id)
WHERE i.payment_date IS NOT NULL;

