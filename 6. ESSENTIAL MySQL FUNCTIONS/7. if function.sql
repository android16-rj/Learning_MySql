-- IF FUNCTION

-- IF(EXPRESSION, FIRST VALUE, SECOND VALUE )

SELECT 
order_id,
order_date,
IF(
	YEAR(order_date) = YEAR(NOW()), 
	'ACTIVE', 
	'ARCHIVED') AS category
FROM orders;

-- EXERCISE:  WRITE A QUERY TO RETURN THIS RESULT : PRODUCT_ID , NAME(PRODUCTNAME), ORDERS, FREQUENCY(ONCE, MANYTIMES)
-- 
SELECT 
p.product_id,
p.name,
COUNT(*) AS orders,
IF(COUNT(*) > 1, 'Many times','once') AS frequency
FROM products p
JOIN order_items oi
USING(product_id)
GROUP BY
product_id,
name;