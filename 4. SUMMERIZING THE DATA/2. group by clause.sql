-- Group by clause

SELECT client_id,
sum(invoice_total) as Total_sales
FROM invoices
WHERE invoice_date >= '2019-07-01'
GROUP BY client_id
ORDER BY Total_sales DESC;

SELECT 
state,
city,
sum(invoice_total) as Total_sales
FROM invoices i
JOIN clients 
USING (client_id)
GROUP BY state, city;

-- exercise: querry to generate this report date, payment_method, total payments, (combination of date and payment method)

select p.date,
	   pm.name AS payment_Method,
       SUM(p.amount) AS total_payments
FROM payments p
join payment_methods pm
ON p.payment_method = pm.payment_method_id 
GROUP BY p.date, payment_method
ORDER BY p.date; 