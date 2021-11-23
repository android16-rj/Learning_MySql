USE sql_store;
SELECT *
FROM sql_store.customers
LIMIT 6, 3 ;

-- get top 3 loyal customers, these customers have more points than others

SELECT *
FROM customers
ORDER BY points DESC
LIMIT 3;

-- LIMIT CLAUSE ALWAYS COMES TO THE END

