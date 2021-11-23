-- in a real world when you work as developer or as a database administrator quite often u have to work with multiple DBs
-- how to combine columns from tables from multiple DBs

SELECT *
FROM order_items oi
JOIN sql_inventory.products ip
ON oi.product_id = ip.product_id; -- we have to prefix the table with DBs eg sql_inventory.products
