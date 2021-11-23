-- the all keyword
-- select all the invoices larger than all invoices of
-- client  3

USE sql_invoicing;

SELECT *
FROM invoices
WHERE invoice_total >(
		SELECT MAX(invoice_total)
		FROM invoices
		WHERE client_id = 3
);

-- solving the above problem using ALL keyword

SELECT * 
FROM invoices 
WHERE invoice_total > ALL(
		SELECT invoice_total 
		FROM invoices
		WHERE client_id = 3
);

-- IN MY OPINION BOTH THE QUERIES ARE READABLE
-- SOME DEVELOPERS USE MAX() AND SOME USE ALL() KEYWORD

-- ALL KEYWORD 
-- in the above query , invoice_total will compare all the values rows inside the all keywrd
-- for eg

SELECT *
FROM invoices 
WHERE invoice_total > ALL( 150, 126, 450, .. );