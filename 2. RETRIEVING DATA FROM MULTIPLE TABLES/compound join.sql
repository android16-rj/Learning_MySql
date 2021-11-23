-- compound join conditions
SELECT *
FROM order_items oi 
JOIN order_item_notes oin
ON oi.order_id = oin.order_id
AND oi.product_id = oin.product_id;
-- compound join means joining of the tables on the basis of two primary keys. google composite primary key.
-- composite primary key means two columns combinely represent one col
-- eg. order id and product id combinely represent order items