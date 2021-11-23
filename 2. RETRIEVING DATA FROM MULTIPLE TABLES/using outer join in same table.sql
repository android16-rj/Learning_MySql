-- we want to find out all the employees and their manager using employees table

USE sql_hr;

SELECT 
e.employee_id,
e.first_name,
e.last_name,
e.job_title,
m.first_name as Manager
FROM employees e
LEFT JOIN employees m
ON e.reports_to = m.employee_id;