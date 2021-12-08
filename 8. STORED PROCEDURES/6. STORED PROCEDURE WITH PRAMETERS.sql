-- PARAMETERS WITH DEFAULT VALUE
-- IN THIS TUTORIAL WE GOANNA LEARN HOW TO ADD DEFAULT VALUE TO THE PARAMETER

-- WE WILL USE THE get_clients_by_state PARAMETER
-- IF WE DO NOT PASS A VALUE TO THE PARAMETER, BY  DEFAULT IT SHOULD SHOW VALUE OF CALIFORNIA STATE
-- WE USE IF STATEMENT LIKE BELOW


DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2)
)
 BEGIN 
 IF state is NULL THEN
 SET state = 'CA';
 END IF;
 SELECT *
 FROM clients c
 WHERE c.state = state;
 END $$
 DELIMITER ;
 
 -- now calling the procedure
 
 CALL get_clients_by_state(NULL); -- IT WILL RETURN THE VALUES HAVING THE 'CA' AS STATE
								 -- NOTICE WE HAVE GIVEN THE VALUE NULL, WE HAVE TO PASS THE VALUE AT ANY CASE
                                 
-- NOW WHAT IF WE WANT TO RETRIEVE ALL THE VALUES OF INSTEAD OF PARTICULAR STATE AS DEFAULT VALUE
-- WE CAN USE SELECT STATEMENT HERE 
DROP PROCEDURE get_clients_by_state; -- dropping the procedure so that we can recreate it

DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2)
)
 BEGIN 
	IF state is NULL THEN
		SELECT * FROM CLIENTS;
	ELSE  
		SELECT *
		FROM clients c
		WHERE c.state = state;
 END IF;
 
 END $$
 DELIMITER ;
 
 -- now call the procedure with the null as value
 CALL get_clients_by_state(NULL); -- IT RETURNS ALL THE STATE VALUE
 CALL get_clients_by_state('CA');-- IT WILL RETURN THE CLIENTS FROM CA ONLY
 
 /* NOW THE QUERY ABOVE LOOKS LITTLE VERBOSE
 	IF state is NULL THEN
		SELECT * FROM CLIENTS;
	ELSE  
		SELECT *
		FROM clients c
	END IF;
    -- TWO SELECT STATEMENTS LOOKS LITTLE VERBOSE AND LOOKS AMATUARE
    -- WHAT IF WE CAN COMBINE THESE TWO QUERRIES INTO A SINGLE QUERY
    */
DROP PROCEDURE get_clients_by_state;
DELIMITER $$
CREATE PROCEDURE get_clients_by_state
(
	state CHAR(2)
)
BEGIN
	SELECT *
	FROM clients c
	WHERE c.state = IFNULL(state, c.state); -- whats going on here if state value is null then it will return the c.state value
END $$
DELIMITER ;

-- EXERCISE: WRITE A STORED PROCEDURE CALLED get_payments
  -- with two parameters
		-- client_id int(2)
        -- payment_method_id TINYINT
        
DELIMITER $$
CREATE PROCEDURE get_payments
(
	client_id INT, -- INT TAKES 4 BYTES WITHIN THIS WE CAN STORE LARGE NUMBERS
    payment_method_id TINYINT -- TINYINT TAKES 1 BIT OF MEMORY WHERE WE CAN STORE NO FROM 0 TO 255
)
BEGIN
	SELECT p.client_id,
	pm.name
	FROM payments p
	LEFT JOIN
	payment_methods pm
	on p.payment_method = pm.payment_method_id
    WHERE p.client_id = IFNULL(client_id, p.client_id)
    AND pm.payment_method_id = IFNULL(payment_method_id, pm.payment_method_id);
END$$
DELIMITER ;

CALL get_payments(null, null);  -- we will get all the values
CALL get_payments(5, null); -- we will get all the value of  client having client_id 5 
CALL get_payments(5,1); -- we will get all the values of client_id 5, having payment_method_id as 1 ie credit card
CALL get_payments(3,2); -- it returned no records because,client id 3 does not have payment method id as  ie cash
CALL get_payments(NULL,2)  -- FINDING ALL THE RECORDS WITH PAYMENT METHOD ID 2 IE CASH        
        
        