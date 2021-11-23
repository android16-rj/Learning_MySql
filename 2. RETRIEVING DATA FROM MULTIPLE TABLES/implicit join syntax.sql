-- implicit join syntax
SELECT *
FROM orders o
JOIN customers c
on o.customer_id = c.customer_id;

-- we can write the above query the following way also
-- what we call the below querry a implicit join syntax, but do not use it, if u accidently forget to use the where clause
-- you will get cross join 
SELECT *
FROM orders o, customers c
WHERE o.customer_id = c.customer_id;