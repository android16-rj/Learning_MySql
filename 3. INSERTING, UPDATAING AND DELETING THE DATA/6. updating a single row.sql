-- 6. updating a single row
-- observe the invoicing table, first record with invoice id is 1. has payment total as 0 and payment date as null
-- maybe because of some error this happened, now want to update the record.
-- we use UPDATE clause to update the one or more records in the table.

USE sql_invoicing;

UPDATE invoices
SET payment_total = 10, payment_date = '2019-03-01'
WHERE invoice_id = 1;

-- now lets update it back to it used to be ie payment total as 0 and payment date as NULL
-- before updating any rows make sure to see the table design to see what values are allowed ,like default values and null allowed or not

UPDATE invoices
SET payment_total = DEFAULT, 
payment_date = DEFAULT -- or you can use payment_date = NULL
WHERE invoice_id = 1;

-- lets update the 3rd record with invoice_id as 3, the payment made is 147.5 $ and 
-- lets assume the client made 50% payment on due date 
UPDATE invoices
SET payment_total = invoice_total * (50/100),
payment_date = due_date
WHERE invoice_id = 3;


