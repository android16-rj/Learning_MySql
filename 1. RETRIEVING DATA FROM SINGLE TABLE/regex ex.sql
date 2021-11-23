USE sql_store;
SELECT *
From customers;

SELECT *
From customers
Where NOT (birth_date > '1990-01-01' OR points >1000 AND state = 'VA');

SELECT *
FROM customers
WHERE state = 'VA' OR state = 'GA' OR state = 'FL';

SELECT *
FROm customers
WHERE state in ('VA', 'GA', 'FL');

SELECT *
FROM Customers
WHERE points BETWEEN 1000 AND 3000;

SELECT *
FROM customers 
WHERE birth_date BETWEEN '1990-01-01' AND '2000-01-01';	


SELECT * 
FROM customers 
WHERE last_name LIKE 'p%'; -- last name starts with p% 


SELECT * 
FROM customers 
WHERE last_name LIKE '%p%'; -- last name Contains p

SELECT * 
FROM customers 
WHERE last_name LIKE '%y'; -- last name ends with y

SELECT * 
FROM customers 
WHERE last_name LIKE '_____y'; -- last name ends with y and have 6 four characters, each underscore means there is a character.alter


SELECT *
FROM customers
WHERE last_name LIKE 'b____y'; -- the last nane has b as first char and y as last char abnd have 6 character in total


SELECT *
FROM customers
WHERE address LIKE '%trail%' OR address LIKE '%avenue%';

SELECT *
FROM customers
WHERE phone Like '%9';

SELECT * 
FROM customers
WHERE last_name REGEXP 'field';


SELECT *
FROM customers
WHERE first_name REGEXP 'elka|ambur'; -- OR first_name REGEXP 'ambur';

SELECT *
FROM customers
WHERE last_name REGEXP 'ey$|on$';
 
 SELECT *
 FROM customers 
 WHERE last_name REGEXP '^my|se';
 
 SELECT *
 FROM customers
 WHERE last_name REGEXP 'b[ru]';