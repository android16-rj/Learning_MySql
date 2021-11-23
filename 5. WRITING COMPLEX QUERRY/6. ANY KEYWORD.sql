-- ANY KEYWORD
-- ANY KEYWORD IS EQUIVALENT TO IN OPERATOR
-- IN MYSQL THERE IS ANY AND SOME KEYWORD

-- SELECT THE CLIENTS WITH ATLEAST 2 INVOICES

SELECT * 
FROM clients
WHERE client_id IN (
		SELECT client_id
		FROM invoices 
		GROUP BY client_id
		HAVING COUNT(*) >= 2
);

-- WE CAN REMOVE IN and add = ANY

SELECT * 
FROM clients
WHERE client_id = ANY(
		SELECT client_id
		FROM invoices 
		GROUP BY client_id
		HAVING COUNT(*) >= 2
);