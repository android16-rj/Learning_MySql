-- OUTPUT PARAMETERS

-- WE LEARNED HOW TO USE PARAMETERS TON PASS VALUES TO OUR STORED PROCEDURES 
-- WE CAN ALSO USE PARAMETERS TO RETURN VALUES FOR CALLING PROGRAMME

DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_clients
(
	client_id INT
)
BEGIN
	SELECT count(*), SUM(invoice_total)
    FROM invoices i
    WHERE i.client_id = client_id AND payment_total = 0;
END$$
DELIMITER ;

call sql_invoicing.get_unpaid_invoices_for_clients(3); -- NOW FOR CLIENT_ID 3 WE 2 COUNT OF INVOICES AND SUM OF 286 OUTSTANDING BALANCE

-- WE CAN ALSO RECIEVE THESE VALUES THROUGH PARAMETERS
-- WE NEED TO ADD COUPLE MORE PARAMETERS TO OUR PROCEDURE 


DELIMITER $$
CREATE PROCEDURE get_unpaid_invoices_for_clients
(
	client_id INT,						-- MOST OF THE PARAMETERS IN STORED PROCEDURES ARE BY DEFAULT INPUT PARAMETRS
    OUT invoices_count INT,				-- SO TO PREFIX FROM EXEMPTING THE INPUT, WE ADD OUT KEYWORD AND THESE PARAMETERS ARE OUTPUT PARAMETERS
	OUT invoices_total DECIMAL(9, 2)
)
BEGIN
	SELECT count(*), SUM(invoice_total)
    INTO invoices_count, invoices_total  -- we used INTO keywords to read count(*) and sum(invoice_total) values and copy them in invoice_count and invoices_total parameters
    FROM invoices i
    WHERE i.client_id = client_id AND payment_total = 0;
END$$
DELIMITER ;

-- when we called the procedure from workbench
-- and passed value to invoice_id parameter as 3
-- following code appered in query window
/*
set @invoices_count = 0;
set @invoices_total = 0;
call sql_invoicing.get_unpaid_invoices_for_clients(3, @invoices_count, @invoices_total);
select @invoices_count, @invoices_total;
*/
-- lets break down the meaning of the query above 
	-- 1.
	-- set @invoices_count = 0;  -->|
	-- set @invoices_total = 0;  -->|--> these two above are user defined varables, and their initial value is 0.
									 -- we use SET @ to define a variable
	-- 2.
    -- call sql_invoicing.get_unpaid_invoices_for_clients(3, @invoices_count, @invoices_total); -- to call procedure we pass the client id value, ie input parameter
										-- and user defined variables
	-- 3.
    -- select @invoices_count, @invoices_total; -- to display them in results, we use select statement to read these values ie @invoices_count , @invoices_total
    
-- AS WE SAW READING THE OUTPUT PARAMETERS IS REQUIRED LITTLE BIT EFFORT TO READ DATA 
-- AND IT IS SUGGESTED TO AVOID THEM UNLESS YOU HAVE THE VALID REASON FOR USING THEM
                                     