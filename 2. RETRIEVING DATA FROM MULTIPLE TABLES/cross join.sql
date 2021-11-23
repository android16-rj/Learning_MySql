-- cross joins
-- cross joins to combine every records from first table and every records from second table

SELECT 	
c.first_name AS customer_name,
p.name AS product_name
FROM customers c
CROSS JOIN products p
ORDER BY customer_name;

-- do a cross join between shippers and products
-- using the implicit syntax
-- and then using the explicit syntax


-- implicit syntax
SELECT 
p.product_id,
sh.shipper_id,
p.name
FROM products p, shippers sh;

-- explicit syntax

SELECT
p.name AS product_name,
sh.name AS shipper_name
FROM shippers sh
CROSS JOIN products p
ORDER BY shipper_name;