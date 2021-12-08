-- PARAMETER VALIDATION
-- SO FAR WE HAVE SEEN PROCEDURES STORE DATA
-- BUT PROCEDURES UPDATE, INSERT AND DELETE THE DATA
-- IN THIS SESSION WE GONNA CREATE A PROCEDURE TO UPDATE THE DATA AND AS A PART OF THIS WE GONNA LOOK AT PARAMETERS VALIDATION
-- TO INSURE OUR PROCEDIRE ACCIDENTLY DOESNT STORE THE BAD DATA IN OUR DATABASE


DELIMITER $$
CREATE PROCEDURE make_payments
(
	invoice_id INT,
    payment_amount DECIMAL(9, 2), -- HERE WE HAVE 2 ARGUMENTS 9 -TOTAL NO OF DIGITS, 2- NOS AFTER DECIMAL POINTS
	payment_date DATE
    )
BEGIN
	UPDATE invoices i 
    SET i.payment_total = payment_amount,
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;

-- if we call the procedure with values invoice_id 2,payment_amount 100 and payment_date as 2019-01-01
-- it will update the record in invoices table accordingly
-- but what if we pass the negative value to payment_amount, it will show -100 if we pass -100
-- that is invalid, we should not store invalid data in our database
-- how to validate the value we pass to our parameters
-- before our UPDATE STATEMENT WE GONNA USE IF STATEMENT TO VALIDATE OUR PARAMETERS

DELIMITER $$
CREATE PROCEDURE make_payments
(
	invoice_id INT,
    payment_amount DECIMAL(9, 2), -- HERE WE HAVE 2 ARGUMENTS 9 -TOTAL NO OF DIGITS, 2- NOS AFTER DECIMAL POINTS
	payment_date DATE
    )
BEGIN
	IF payment_amount <=0 THEN 
		SIGNAL SQLSTATE '22003' SET MESSAGE_TEXT =  'INVALID PAYMENT AMOUNT'; -- WE USE SIGNAL STATEMENT TO SIGNAL OR RAISE AN ERROR ,
	END IF;																	 -- THIS IS LIKE THROWING AN EXCEPTION IN OTHER PROGRAMMING LANGUAGES
	UPDATE invoices i 														 --  SET_MESSAGE IS OPTIONAL, IT IS FURTHER EXPLAINATION OF WHAT WENT WRONG
    SET i.payment_total = payment_amount,									  
		i.payment_date = payment_date
	WHERE i.invoice_id = invoice_id;
END $$
DELIMITER ;

-- now calling the procedure with invalid value it raises the error of INVALID PAYMENT AMOUNT
call sql_invoicing.make_payments(2, -100, '2019-01-01');

-- IT IS GOOD TO VALIDATE THE VALUE WE PASS TO THE PROCEDURE FOR UPDATE, BECAUSE BAD DATA SHALL NOT BE ENTERED TO THE DATABASE
-- BUT KEEP YOUR VALIDATION TO BARE MINIMUM, BECAUSE IT LOOKS MESSY AND BECOMES HARD TO MAINTAIN
