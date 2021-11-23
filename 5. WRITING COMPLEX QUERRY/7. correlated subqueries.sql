-- correlated subqueries

-- selec the employees whose salary is above the average
-- in their offices

USE sql_hr;

SELECT *
FROM employees
		WHERE salary > (
		SELECT AVG(salary)
		FROM employees
);

-- for each employee
--   calculate the avg salary for employee.office
--   return the emplyee if salary > avg salary

SELECT * 
FROM employees e
WHERE salary > (
		SELECT AVG(salary)
		FROM employees
		WHERE office_id = e.office_id
);
-- the above query is called as correlated subquery


-- exercise : get the invoices that are larger than then 
-- the client's average invoice amount

USE sql_invoicing;

SELECT *
FROM invoices i
WHERE invoice_total > (
			SELECT AVG(invoice_total)
			FROM invoices
			WHERE client_id = i.client_id
);
 