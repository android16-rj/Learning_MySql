-- creating views

-- when we get the results by having complex queries using sub queries and joins
-- we can simplify these querries by saving as views, so that we can resuse them again.
-- we can use views as a table.

USE sql_invoicing;
SELECT
c.client_id,
c.name,
SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i	USING(client_id)
GROUP BY client_id, name;

-- now we can see total sales by each client
-- this is very useful query, in future we will have queries that might be based on this query
-- for eg top clients, or clients with least sales
-- instead of writing this select statement every time 
-- we can save this query as view and use it many places 
-- LETS CREATE A VIEW

CREATE VIEW sales_by_client AS 
SELECT
c.client_id,
c.name,
SUM(invoice_total) AS total_sales
FROM clients c
JOIN invoices i	USING(client_id)
GROUP BY client_id, name;

-- EXERCISE: CREATE A VIEW TO SEE THE BALANCE FOR EACH CLIENT 
		-- NAME OF VIEW : clients_balance
        -- in this view we should have 
			-- client_id 
            -- name 
            -- balance
					-- calculate  balence by invoice total - payment_total
            
CREATE VIEW clients_balance AS
SELECT c.client_id,
c.name,
SUM(i.invoice_total - i.payment_total) AS balance
FROM clients c
JOIN invoices i
USING(client_id)
GROUP BY client_id, name;