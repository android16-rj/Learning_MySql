-- VARIABLES

-- WE DEFINE VARIABLE USING SET KEYWORD AND we prefix them with @, EG SET @invoice_total
-- these variables will be in memory during the entire sessions of clients, when the clients table disconnects from mysql
	--  thsese variables will be freed out
-- we call thsese variable as > user or session variables 
-- im Mysql we have another type of variable, ie, local variable
	-- local variables dont stay in memory for entire session 
    -- as soon as our procedure finish execution these variables free out
    -- quite often we use these variables perform calculations in our stored procedures 
    
DELIMITER $$
CREATE PROCEDURE get_risk_factor
(
	
)
BEGIN

	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*),
    SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices;
    -- risk_factor = invoices_total/invoices_count*5 
    SET risk_factor = invoices_total / invoices_count * 5;
    SELECT risk_factor;
END$$
DELIMITER ; 