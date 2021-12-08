-- PARAMETERS
-- HOW TO ADD PARAMETERS TO STORED PROCEDURES
-- WE TYPICALLY USE PARAMETERS TO PASS A VALUE TO YOUR STORED PROCEDURES
-- BUT WE CAN ALSO USE PARAMETERS TO SEND VALUES for calling programme
-- IN PARANTHESIS WE NEED TO ADD PARAMETER 'state' and add type CHAR(2) two letters for states eg CA for california like below line
-- CREATE PROCEDURE get_clients_by_state(state CHAR(2))
			-- we also have VARCHAR(), variable character for name, phone no, messeges, etc
            -- most of the time we use VARCHAR, in this case our variable have fixed value  two letters for state
            -- so we used CHAR
-- THER ABOVE CODE IS UNREADABLE SO WE BREAK IT DOWN LIKE BELOW
/*
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2)
)
*/
-- IF WE HAVE MULTIPLE PARAMETERS WE NEED TO SEPARATE THEM USING ,LIKE BELOW
/*
DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2),
city CHAR(50),
pin_code INT(6)
)
*/

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
state CHAR(2)
)
BEGIN
	SELECT * FROM
    clients c
    WHERE c.state = state;  -- when we use state = state, it is bit wierd because the condition always gonna be true
END$$                     -- people use p_state or state_parameter , i dont like this because this is sort of verbose
DELIMITER ;				  -- so use alias for table insted so it becomes c.state = state, now we are comparing state value with state parameter


CALL get_clients_by_state('NY'); -- IM GONNA PASS 'CA' AS CALIFORNIA AND THIS RETURNS CLIENTS IN CALIFORNIA
CALL get_clients_by_state() -- THIS WILL THROW THE ERROR, WE NEED TO SUPPLY ALL THE VALUE TO THE PARAMETERS, IF WE DONT IT WILL THROW AN ERROR

-- EXERCISE: WRITE A STORED PROCEDURE TO RETURN INVOICES 
		-- FOR A GIVEN CLIENT
		-- get_invoices_by_client
        
DELIMITER $$
CREATE PROCEDURE get_invoices_by_client
( 
client_id INT
)
BEGIN
	SELECT *
    FROM invoices i
    WHERE i.client_id = client_id;
END $$
DELIMITER ;



