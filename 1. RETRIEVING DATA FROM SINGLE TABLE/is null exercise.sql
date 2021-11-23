SELECT *
FROM customers;

SELECT *
FROM customers
WHERE phone IS NULL;

-- GET THE ORDERS NOT SHIPPED YET 

SELECT * 
FROM orders;

SELECT *
FROM orders 
WHERE shipped_date IS NULL OR shipper_id IS NULL;

