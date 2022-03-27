-- the using clause
-- when we join the two tables using join clause but it makes querry more commplex and difficult to read
-- we can avoid it by applying using clause


USE sql_store;
SELECT
o.order_id,
c.first_name,
c.last_name,
sh.name
FROM orders o
JOIN customers c
using (customer_id) -- earlier we used 'ON o.customer_id = c.customer_id'
LEFT JOIN shippers sh
USING (shipper_id); -- likewise we can join another table/ using caluse only applicable if we have same column name.


-- Exercise, in our order items table we have composite primary key we should join the order item notes table

SELECT 
oi.order_id,
oi.product_id,
oin.note
FROM order_items oi
LEFT JOIN order_item_notes oin
ON oi.order_Id = oin.order_Id OR oi.product_id = oin.product_id; -- can use AND / can use USING(order_id, product_id)

-- from the sql_invoicing DB write a query select payments from payments table get date cleint amount name(payment method
USE sql_invoicing;

SELECT 
p.date,
c.name,
p.amount,
pm.name AS payment_method
FROM payments P
LEFT JOIN clients c
USING (client_id)
LEFT JOIN payment_methods AS pm
ON p.payment_method = pm.payment_method_id;
