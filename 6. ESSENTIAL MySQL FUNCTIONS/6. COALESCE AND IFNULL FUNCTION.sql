-- IFNULL and COALESCE FUNCTIONS

-- 

SELECT 
order_id,
IFNULL(shipper_id,'NOT ASSIGNED') AS Shipper
FROM orders;

-- COALESCE FUNCTION.

SELECT 
order_id,
COALESCE(shipper_id, comments, 'not assigned') AS Shippers
FROM orders;

-- EXERCISE:  WRITE A QUERY TO PRODUCE RESULT CUSTOMER, PHONE , IF PHONE IS NULL RETURN NULL

SELECT 
CONCAT(first_name , ' ', last_name) AS Customer,
IFNULL(phone, 'Unknown') AS Phone
FROM customers;
  --  or --

SELECT 
CONCAT(first_name , ' ', last_name) AS Customer,
COALESCE(phone, 'Unknown') AS Phone
FROM customers;