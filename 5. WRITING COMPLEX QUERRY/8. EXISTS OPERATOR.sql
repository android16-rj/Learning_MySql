-- exists operator
-- select the clients that have invoice

-- we can use IN operator or join

SELECT 	*
FROM clients
WHERE client_id IN (
SELECT DISTINCT client_id
FROM invoices
);

-- IF YOU DO INNER JOIN BETWEEN CLIENTS TABLE AND INVOICES YOU WILL GET CLINTS THAT HAVE INVOICES

SELECT DISTINCT 
	client_id,
	name, 
	address
FROM clients
JOIN invoices
USING(client_id);


-- solving the problem using EXISTS operator
SELECT *
FROM clients c
WHERE EXISTS (
SELECT client_id
FROM invoices i
WHERE client_id = c.client_id 
);

-- using IN operator produces large results, and it will not execute faster if there is large datasets
-- so we should use exists operator because the subquery does not produces resultset in the outer query so it executes faster

-- EXERCISE : find the products that have never been ordered 
		-- imagine the websites like amazon and they have 100 of thousands of products and millions of orders
        -- if you use the IN operator the subquery gonna return a large resultset it is efficient to use exists operator
      
USE sql_store;

SELECT *
FROM products p
WHERE  NOT EXISTS (
		SELECT product_id
		FROM order_items
		WHERE product_id = p.product_id
)
