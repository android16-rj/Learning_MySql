-- SUBQUERRIES

-- in oour sql_store DBs 
-- find the products that are more 
-- expensive than lettuce (id = 3)

SELECT * 
FROM products 
WHERE unit_price > (
SELECT unit_price
FROM products 
WHERE product_id = 3
);

-- exercise : in sql_hr database:
-- find employees whose earn is more than average.

USE sql_hr;

SELECT employee_id,
	   first_name,
       last_name,
       job_title,
       salary
FROM employees
WHERE salary > (
		SELECT AVG(salary)
        FROM employees
        )
       