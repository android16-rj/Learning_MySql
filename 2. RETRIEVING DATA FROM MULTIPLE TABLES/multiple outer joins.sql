-- similar to inner joins we can use outer joins between multiple table 
-- AVOID RIGHT JOINS USE LEFT JOINS INSTEAD
SELECT 
c.customer_id,
c.first_name,
o.order_id,
sh.name AS Shipper
FROM customers c
LEFT JOIN orders o
ON c.customer_id = o.customer_id
LEFT JOIN shippers sh
ON o.shipper_id = sh.shipper_id;

-- EXERCISE return order_date , order_id, first_name, shipper, status
--                  orders       orders     customers  shippers order status


SELECT 
o.order_id,
o.order_date,
c.first_name,
sh.name AS shipper,
os.name AS status
FROM orders o
LEFT JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN Shippers sh
ON o.shipper_id = sh.shipper_id
LEFT JOIN order_statuses os
on o.status = os.order_status_id
ORDER BY status;

