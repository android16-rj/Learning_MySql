-- FUNCTIONS
-- SO FAR WE HAVE SEEN MANY FUNCTIONS IN MYSQL LIKE SUM, AVG, ETC
-- IN THIS SESSION WE GONNA LEARN HOW TO CREATE OUR OWN  FUNCTION
-- FUNCTIONS ARE SIMILAR TO STORED PROCEDURES BUT THE MAIN DIFFERENCE IS A FUNCTION CAN RETURN ONLY A SINGLE VALUE
-- UNLIKE STORED PROCEDURES THEY CANNOT RETURN RESULTS WITH MULTIPLE ROWS AND COLUMNS 
-- IN SITUATIONS WHERE YOU WANT TO RETURN  THE SINGLE VALUE, YOU CAN CREATE A FUNCTION
-- A GOOD EXAMPLE OF THIS IS THE CALCULATION OF RISK FACTOR THAT WE MADE USING THE PROCEDURE
-- BUT WE GONNA CALCULATE THE RISK FACTOR USING THE FUNCTION 

/*

CREATE FUNCTION get_risk_factor_for _clients
(
	client_id INT
)
RETURNS INTEGER -- MAIN DIFF BETWEEN PROCEDURE AND FUNCTION IS RETURN STATEMENT AND INTEGER HERE DENOTES WHAT WE WANT TO RETURN, WE CAN RETURN CHAR, DECIMAL,ETC
DETERMINISTIC -- RIGHT AFTER RETURN STATEMENT WE HAVE TO SPECIFY THE ATTRIBUTES, 3 TYPES OF ATTRIBUTES ARE THERE, 
				--DETERMINISTIC MEANS FIXED VALUE, FOR eg YOU HAVE TO RETURN 10% TAX OF TOTAL INCOME 
READS SQL DATA -- THIS MEANS YOU HAVE TO WRITE SELECT STATEMENT
MODIFIES SQL DATA -- THAT MEANS YOU HAVE TO USE INSERT, UPDATE,DELETE ETC
					-- WE CAN HAVE MULTIPLE ATTRIBUTES
BEGIN
          <- HERE WE WRITE OUR SELECT STATEMENT
RETURN 1; <- AND FINALLY IT SHOULD RETURN SOME VALUE
END
*/

-- IN OUR FUNCTION THE ATTRIBUTE IS NOT GOING TO BE DETERMINISTIC, BECAUSE IF A CLIENT PAYS SOME BAL IT GONNA SHOW SAME RISK FACTOR
DELIMITER $$
CREATE FUNCTION get_risk_factor_for_clients
(
	client_id INT
) 
RETURNS INT
READS SQL DATA
BEGIN
	DECLARE risk_factor DECIMAL(9, 2) DEFAULT 0;
    DECLARE invoices_total DECIMAL(9, 2);
    DECLARE invoices_count INT;
    
    SELECT COUNT(*),
    SUM(invoice_total)
    INTO invoices_count, invoices_total
    FROM invoices i
    WHERE i.client_id = client_id;
    SET risk_factor = invoices_total / invoices_count * 5;
	RETURN IFNULL(risk_factor, 0);  -- now the clients having no invoices return null, so we use IFNULL keyword
END $$
DELIMITER ;

-- WE CAN USE OUR FUNCTION IN OUR SELECT STATEMENTS JUST LIKE OUR BUILT IN FUNCTIONS IN MYSQL
SELECT client_id,
name,
get_risk_factor_for_clients(client_id) AS risk_factor-- we added third column specifying the risk factor for each clients
FROM clients;
-- KEEP THEM UNDER SOURCE CONTROL
