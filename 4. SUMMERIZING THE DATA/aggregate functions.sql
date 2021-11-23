-- aggregate function
-- in this section we gonna learn how to write a querry  how to summerize the data
-- for eg querries that report sales by client or state. these are some common questions that businesses ask
-- this section is very useful, specially if you work in a large organization with lots of data. every day you have to write lots of qauerries
-- MIN() ,MAX(), AVG(), sum(), count() these are called aggregate functions



-- MAX() FUNCTION 

SELECT MAX(invoice_total)
FROM sql_invoicing.invoices; -- we found max value  and name of the col is max(invoice_total)

-- using MIN() ,MAX(), AVG() functions in same querry

SELECT MIN(invoice_total) AS Min_amount,
MAX(invoice_total) AS Max_amount,
AVG(invoice_total) AS Avg_amount
FROM sql_invoicing.invoices;

-- we can use these function with other datatypes as well

SELECT MAX(payment_date) AS latest_date -- this max will return latest date
FROM invoices;

-- using MIN() ,MAX(), AVG(), sum(), count() functions in same querry
SELECT MIN(invoice_total) AS Min_amount,
MAX(invoice_total) AS Max_amount,
AVG(invoice_total) AS Avg_amount,
SUM(invoice_total) AS total_amount,
COUNT(invoice_total) AS No_of_invoices
FROM sql_invoicing.invoices;

-- aggregate functions operate on non null values, if theres null values in the cols its not gonna include eg.

SELECT COUNT(invoice_total) AS No_of_invoices, -- it gives 17 as output
COUNT(payment_date) AS count_of_dates, -- it gives 7 because the col supports null and there are null values in the col and it doesnt support nulls
COUNT(*) AS total  -- to get records irrespective of nulls, it gives 17
FROM invoices;

-- further scopes of aggregate functions

SELECT MIN(invoice_total) AS Min_amount,
MAX(invoice_total) AS Max_amount,
AVG(invoice_total) AS Avg_amount,
SUM(invoice_total * 1.5) AS total_amount,  -- to get the 1.5 times the total amount
COUNT(*) AS Total_records
FROM sql_invoicing.invoices
WHERE invoice_date > '2019-07-01'; -- invoices after july 2019

     -- now we will count client id
     -- but count id has duplicate values
     -- for that problem we use COUNT DiSTINCT() function
SELECT MIN(invoice_total) AS Min_amount,
MAX(invoice_total) AS Max_amount,
AVG(invoice_total) AS Avg_amount,
SUM(invoice_total * 1.5) AS total_amount,  -- to get the 1.5 times the total amount
COUNT(DISTINCT client_id) AS Total_records
FROM sql_invoicing.invoices
WHERE invoice_date > '2019-07-01'; -- invoices after july 2019

-- exercise: write a querry to generate date_range, total_sales, total_payments, what_we_axpect (difference bet total sales- toral payments)

SELECT 'First Half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
sum(payment_total) AS total_payments,
SUM(invoice_total - payment_total) AS what_we_expect
From invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-06-30'
UNION
SELECT 'Second half of 2019' AS date_range,
SUM(invoice_total) AS total_sales,
sum(payment_total) AS total_payments,
SUM(invoice_total - payment_total) AS what_we_expect
From invoices
WHERE invoice_date BETWEEN '2019-07-01' AND '2019-12-31'
UNION
SELECT 'total' AS date_range,
SUM(invoice_total) AS total_sales,
sum(payment_total) AS total_payments,
SUM(invoice_total - payment_total) AS what_we_expect
From invoices
WHERE invoice_date BETWEEN '2019-01-01' AND '2019-12-31';