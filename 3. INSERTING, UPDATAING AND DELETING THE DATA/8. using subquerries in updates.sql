-- using sub querries
-- in this tutorial we gonna learn how to update using subquerries
-- in this eg we gonna update the rows for client with client id as 3
-- but what if we do not have client id , we only have name
-- if we have an application, where we have to type name of the client
-- first we should find the id of client and use that id to update all rows associated with that client id

-- a subquerry is a select statement within another sql statement querry


USE sql_invoicing;

UPDATE invoices
SET payment_total = invoice_total * 50/100,
payment_date = due_date
WHERE client_id = 
			(SELECT client_id
            FROM clients 
            WHERE name = 'myworks');
            
-- what if we need to update our querry clients living in NY and cache index

UPDATE invoices
SET payment_total = invoice_total * 50/100,
payment_date = due_date
WHERE client_id IN                               -- now the subquerry will return multiple values so we cannot use '=' so we use IN
			(SELECT client_id
            FROM clients 
            WHERE state IN ('NY', 'CA')); 
            
            
-- exercise back to our sql_store DB see orders table, some of the records dont have the comments
-- update the comments for the orders for the customers those have more than 3000 points regard them as gold customers 

USE sql_store;

UPDATE orders
SET comments = 'Gold'
WHERE customer_id IN 
				(SELECT customer_id
                FROM customers
                WHERE points > 3000)



