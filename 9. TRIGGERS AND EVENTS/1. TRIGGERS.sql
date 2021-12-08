-- TRIGGERS

-- A TRIGGER IS A BLOCK OF CODE THAT AUTOMATICALLY GETS EXECUTED BEFORE OR AFTER AN INSERT, UPDATE OR DELETE STATEMENT.
-- QUITE OFTEN WE USE TRIGGERS TO ENFORCE DATA CONSISTENCY 
-- FOR EG IN OUR SQL_INVOICING DATABASE WE CAN HAVE MULTIPLE PAYMENTS AGAINST INVOICES
		-- IN OUR PAYMENT TOTAL COLUMN WE HAVE TOTAL OF ALLPAYMENTS MADE
        -- WHENEVER WE INSERT A NEW RECORD IN THE PAYMENT TABLE, WE SHOULD MAKE SURE THE PAYMENT_TOTAL COLIN
		-- IN INVOICES TABLE GETS UPDATED, AND THIS IS WHERE WE USE TRIGGERS
        
DELIMITER $$
CREATE TRIGGER payments_after_inserts 	-- this is sort of convention many people use tablename_after/before_insert
	AFTER INSERT ON payments  			-- here we used 'after' we can use 'before' and we used 
	FOR EACH ROW						-- 'Insert'here we can use 'update'or'delete' also depend what we are going to implememnt, 
										--  for each row means this trigger is fired for each row

BEGIN
	UPDATE invoices									-- in the body of sql code we can write any code to keep our data consistency
    SET payment_total =	payment_total + NEW.amount  -- we used new keyword because we want to return the updated new 'amount' col in payments total-
    WHERE invoice_id = NEW.invoice_id; 				-- we can use 'OLD' keyword for deleting the value in the table and returning the OLD value
END$$				 								-- in NEW.amount, '.' keyword is used so that we can access the individual attribute
DELIMITER ;

-- JUST TO CLEARIFY NOTE THAT , WE CAN MODIFY EVERY OTHER TABLE EXCEPT THE TABLE MENTIONED IN THE CREATE TRIGGER STATEMENT
-- IN THIS CASE WE HAVE payments TABLE 
-- WE CANNOT MODIFY payments table
-- IT WILL ENTER INTO THE INFINITE LOOP AND THE TRIGGER WILL FUCK ITSELF
-- NOW WE GONNA UPDATE ANY RECORD IN AMOUNT COLUMN IN PAYMENTS TABLE TO SEE WHETHER IT UPDATES IN INVOICES TABLE OR NOT
INSERT INTO payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);
-- DEFAULT for payment_id,
-- 5 for client_id,
-- 3 for invoice_id,
-- 2019-01-01 for date
-- 10 for amount,
-- 1 for payment_method

-- NOW IN INVOICES TABLE WE HAVE PAYMENT_TOTAL AS 10, AND THIS IS WHERE TRIGGER KICKED IN

-- EXERCISE: CREATE A TRIGGER WHEN FIRED WILL DELETE A PAYMENT
DELIMITER $$
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
END$$
DELIMITER ;

DELETE
FROM payments
WHERE payment_id = 9;

-- invoice id got updated