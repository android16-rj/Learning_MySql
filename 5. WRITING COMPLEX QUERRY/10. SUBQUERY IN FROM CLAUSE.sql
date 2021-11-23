-- subqueries in the FROM clause

 -- in the last session we learned that we can use subquerries in the select statement of select statement
 
 -- when we executed we get the virtual table and we have it stored in the memory, it is valuable 
 -- it summerizes a lot of data, now we can get the table in memory and use it as the real table in the DBs
 -- we can join it with another table we can filter the table further, group the data,we can do all sort of things
 -- WHEN WE USE SUBQUERY IN THE FROM CLAUSE WE MUST GIVE THE QUERY ALIAS, WHETHER WE USE IT OR NOT.
 SELECT * 
 FROM(
		SELECT 
				client_id,
				name,
				(SELECT SUM(invoice_total)
				FROM invoices
				WHERE client_id = c.client_id) AS total_sales,
				(SELECT AVG(invoice_total) FROM invoices) AS average,
				(SELECT total_sales - average) AS difference
		FROM clients c
	) AS sales_summery;
    
    -- if we do not want the record with total sales as null
 SELECT * 
 FROM(
		SELECT 
				client_id,
				name,
				(SELECT SUM(invoice_total)
				FROM invoices
				WHERE client_id = c.client_id) AS total_sales,
				(SELECT AVG(invoice_total) FROM invoices) AS average,
				(SELECT total_sales - average) AS difference
		FROM clients c
	) AS sales_summary
    WHERE total_sales IS NOT NULL;
    
-- WRITING A SUBQUERY IN THE FROM CLAUSE ACTUALLY MAKES OUR QUERY COMPLEX
-- IT IS BETTER WAY TOF SOLVE THIS PROBLEM USING VIEWS 
-- WE CAN TAKE THIS QUERY AND TAKE THIS IN OUR DB AS A VIEW AND WE CAN CALL THAT VIEW SALES SUMMARY
-- WE WILL LOOK VIEWS LATER IN THIS COURSE.