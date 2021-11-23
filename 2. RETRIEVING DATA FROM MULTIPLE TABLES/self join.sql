-- self join

USE sql_hr;

SELECT *
FROM employees;


-- every emplyee reports to manager and joining the table itself to get the managers name. 

-- joining the same table is pretty much same as the joining two tables
-- we must use two diff alias

SELECT e.employee_id,
e.first_name, 
e.last_name,
m.first_name AS Manager 
FROM employees e
JOIN employees m
ON e.reports_to = m.employee_id;

