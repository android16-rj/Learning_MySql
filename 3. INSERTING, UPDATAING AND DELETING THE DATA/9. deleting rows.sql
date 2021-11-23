-- deleting the rows


DELETE FROM invoices
WHERE invoice_id = 1;

-- USING SUBQUERRY TO DELETE THE ROWS
DELETE FROM invoices
WHERE client_id = 
		(SELECT client_id 
		FROM clients
		WHERE name = 'Myworks')