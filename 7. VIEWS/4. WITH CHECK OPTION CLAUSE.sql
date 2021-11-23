-- THE WITH OPTION CHECK clause

-- following the updating the views example in the previous session 
-- updating the payment total col
-- updating payment total to invoice total so that the balance becomes zero
-- and check whether it is updated in view or not

UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 2;

-- now when we checked the view 
-- the row with invoice_id as 2 disappeared 
-- this is the default behaviour of the views, the particular view gets disappeared when you update

-- TO PREVENT SUCH EXCLUSION,
-- WE SHOULD WRITE 'WITH CHECK OPTION' AT THE END, WHILE CREATING THE VIEW
CREATE OR REPLACE VIEW invoices_with_balance AS
SELECT 
invoice_id,
number,
client_id,
invoice_total,
payment_total,
invoice_total - payment_total AS balance,
invoice_date,
due_date,
payment_Date
FROM invoices
WHERE(invoice_total - payment_total) > 0
WITH CHECK OPTION;  

-- LET US UPDATE THE VIEW NOW
UPDATE invoices_with_balance
SET payment_total = invoice_total
WHERE invoice_id = 3;

-- so we get error 'check option failed'
-- ADDING 'WITH CHECK OPTION' AT THE END OF CREATE VIEW WILL PREVENT ANY SUCH UPDATION WHICH WILL LEAD SUCH DISAPPEARANCE.


