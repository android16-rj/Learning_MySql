-- IN operator

-- in this tutorial we gonna learn how to write a subquerry using the IN operator

-- find the product that have never been ordered 

USE sql_Store;
SELECT p.product_id,
p.name
FROM products p
where p.product_id NOT IN
		(
        SELECT product_id
		FROM  orders o
		JOIN order_items
		USING (order_id)
		);

-- OR

SELECT * 
FROM products
WHERE product_id NOT IN (
			SELECT DISTINCT product_id
			FROM order_items
);

-- EXERCISE: in sql_invoicing DBs , write a querry to find the client without invoices.

USE sql_invoicing;

SELECT *
FROM clients
WHERE client_id NOT IN (
			SELECT DISTINCT client_id
            FROM invoices
);