-- the case operator

-- IN PREVIOUS SESSION WE LEARNED ABOUT THE IF OPERATOR 
-- WHAT IF WE HAVE MULTIPLE  TEST EXPRESSIONS 'IF' OPERATOR ALLOWS ONLY 2 TEST EXPRESSIONS
-- IN SITUATIONS LIKE THESE WE USE CASE OPERATOR

SELECT 
order_id,
CASE
	WHEN YEAR(order_date) = YEAR(NOW()) THEN 'Active'
    WHEN YEAR(order_date) = YEAR(DATE_SUB(NOW(), INTERVAL 1 YEAR)) THEN 'Last Year'   -- USING DATE_SUB()
    WHEN YEAR(order_date) < YEAR(NOW()) - 1 THEN 'ARCHIVED'                           -- USING CONVENTIONAL CODE INSTEAD OF DATE_ADD/DATE_SUB / READABILITY WISE THIS IS BETTER
    ELSE 'Future'                                      -- WE CAN ADD ELSE CLAUSE, IT IS OPTIONAL
	END AS category
FROM orders;


/* EXERCISE: WRITE A QUERY TO CLASSIFY CUSTOMERS AS GOLD/SILVER/BRONZE, >3000 POINTS-- GOLD, 2000-3000 silver, below 2000 bronze
customer name, points, category
*/
	SELECT 
	CONCAT(first_name, ' ', last_name) as customer,
	points,
	CASE 
		WHEN points > 3000 THEN 'Gold'
		WHEN points BETWEEN 2000 AND 3000 THEN 'Silver'
		ELSE 'Bronze'
		END AS category
	FROM customers
	ORDER BY points DESC;
