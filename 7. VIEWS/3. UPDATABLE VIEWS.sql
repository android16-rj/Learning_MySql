-- UPDATABLE VIEWS

-- WHEN A VIEW IN WHICH FUNCTIONS LIKE:
		-- DISTINCT
        -- AGGREGATE FUNCTIONS LIKE(MIN, MAX, AVG, SUM,etc)
        -- GROUP BY/ HAVING
        -- UNION
-- ARE NOT USED WE CAN UPDATE THAT VIEW 

-- CREATING AN UPDATABLE VIEW 

CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
invoice_id,
number,
client_id,
invoice_total,
payment_total,
invoice_total - payment_total AS balance,
invoice_Date,
due_date,
payment_date
FROM invoices
WHERE invoice_total - payment_total > 0;   -- now we have invoices_with_balance view

-- we did not use the any of the functions specified at the top, so we can update/delete the view

DELETE FROM invoices_with_balance
WHERE invoice_id = 1; -- we have successfully deleted the record just like a regular table

-- UPDATE DUE DATE 2 DAYS AFTER

UPDATE invoices_with_balance
SET due_date = DATE_ADD(due_date, INTERVAL 2 DAY);

-- WE CAN UPDATE ROWS TOO BUT IF WE DO NOT PUT ANY OF THE VALUES 
-- IT WILL RETURN ERROR BECAUSE THE TABLE DOES NOT SUPPORTS NULLS


-- FOR SECURITY REASONS WE MIGHT NOT HAVE THE PERMISSION TO WORK WITH THE TABLES
-- SO WE CAN USE VIEWS TO ADD/ DROP THE COLS LIKE UPDATE(EXTEND OR REDUCE) THE DUE_DATE, ETC



