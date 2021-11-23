-- whenever we use the joins we use inner joins  inner keyword is optional.
-- we will write a querry using the inner joins aned then we will convert it to outer joins
-- we have two outer joins left and right

SELECT c.customer_id,
c.first_name,
o.order_id
FROM customers c
JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id; 

SELECT 
c.customer_id,
c.first_name,
o.order_id
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY c.customer_id; 


-- EXERCISE PRODUCT TABLE AND ORDER ITEMS TABLE TO SEE HOW MANY TIMES THE PRODUCT WAS ORDERED

SELECT 
p.product_id, 
p.name,
oi.quantity
FROM products p
LEFT OUTER JOIN order_items oi
ON p.product_id = oi.product_id;