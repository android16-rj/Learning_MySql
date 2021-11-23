SELECT *
FROM orders;
SELECT *
FROM customers;


SELECT *
FROM orders o  -- using o as alias for orders
JOIN customers c -- using c as alias for customers
ON o.customer_id = c.customer_id;

SELECT  orders.customer_id, 
order_id,
first_name, 
last_name
FROM orders
JOIN customers
ON orders.customer_id = customers.customer_id;

-- EXERCISE ~ look at the order items table write a querry to join this table to product table
-- product id and its name followed by product quantity and unit price from order items table

SELECT * 
FROM order_items;

SELECT * 
FROM products;

SELECT order_id,
oi.product_id,
name,
quantity,
oi.unit_price
FROM order_items oi
JOIN products p
ON oi.product_id = p.product_id;