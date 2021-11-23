-- quite often we can rewrite a subquery using a join and or vice versa
-- in last session we wrote a subquery to find the clients without the invoices
-- now we gonna write the query using joins
-- IF WE INNER JOIN THE TABLES WE GONNA FIND THE CLIENTS HAVING INVOICES
-- AND IF WE OUTER JOIN WE GONNA FIND THE CLIENTS WITH INVOICES AND WITHOUT INVOICES
-- which approach should we use, -- well that depends upon the couple of things
   -- one is performance and the other is readability  
-- LATER WE WILL TALK ABOUT THE EXECUTION PLAN AND LEARN HOW TO WRITE A QUERY that gets executed faster 
-- IF THE BOTH THE QUERIES EXECUTED WITHIN THE SAME TIME, YOU SHOULD USE THE QUERY THAT IS MORE READABLE
-- IN THE FOLLOWING EXAMPLE THE FIRST QUERY IS MORE INTUIATIVE BECAUSE IT BETTER ALIGNS WITH THE PROBLEM WE ARE TRYING TO SOLVE



SELECT * 
FROM clients
WHERE  client_id NOT IN (
				SELECT DISTINCT client_id 
                FROM invoices
);


SELECT *
FROM clients
LEFT JOIN invoices 
USING (client_id)
WHERE invoice_id IS NULL;


-- HERE USING THE JOIN IS LITTLE DISTRACTION
-- BUT THIS IS NOT ALWAYS THE CASE, SOIMETIMES USING THE SUBQUERY MAKES YOUR QUERY MORE COMPLEX
-- IN THOSE CASES IT IS BETTER TO USE THE JOIN 
-- SO ALWAYS PAY A GREAT ATTENTION TO THE READABILITY TO UR CODE

-- exercise:  in our sql store DB, write a query to find customers who have ordered lettuce (id = 3)
 -- in your select statement select customer_id, first_name, last_name
 
 USE sql_store;
 
 -- solving the problem using subquery
 
 SELECT customer_id,
		first_name,
		last_name
 FROM customers
 WHERE customer_id IN ( 
			SELECT
			customer_id
			FROM orders o
			JOIN order_items oi
			USING (order_id)
			WHERE product_id = 3
 );
  
  
-- solving the problem using the joins

SELECT DISTINCT customer_id,
			first_name,
			last_name
FROM customers c
JOIN orders o USING (customer_id)
JOIN order_items oi USING (order_id)
WHERE oi.product_id = 3;


-- the query using join is has more readability
-- because there is natural relationship between tables customers, orders, and order_items.