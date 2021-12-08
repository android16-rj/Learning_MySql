-- USING TRIGGERS FOR AUDITING

-- ANOTHER USE CASE FOR TRIGGERS IS LOGGING CHANGES IN DATABASE FOR AUDITING
-- FOR EG WHENEVER SOMEONE INSERTS OR DELETES A RECORD WE CAN LOG IT SOMEWHERE
-- AND LATER WE CAN COME BACK AND SEE WHO, WHAT CHANGES AND WHEN
-- OPEN THE FILE BELOW THIS VIDEA( I'VE COPIED THE CODE FROM THE SCREEN, IT IS BELOW)
/*
USE sql_invoicing;

CREATE TABLE payments_audit
(
	client_id INT,
    date DATE,
    amount DECIMAL(9, 2),
    action_type VARCHAR(50),
    action_date DATETIME
)
*/

DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_inserts;
CREATE TRIGGER payments_after_inserts
	AFTER INSERT ON payments
	FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total =	payment_total + NEW.amount
    WHERE invoice_id = NEW.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (NEW.client_id, NEW.date, NEW.amount, 'Insert', NOW());  -- NOW WE ARE INSERTING VALUES IN PAYMENTS AUDIT TABLE
END$$
DELIMITER ;

-- DOING SAME WITH ANOTHER TRIGGER

DELIMITER $$
DROP TRIGGER IF EXISTS payments_after_delete;
CREATE TRIGGER payments_after_delete
	AFTER DELETE ON payments
    FOR EACH ROW
BEGIN
	UPDATE invoices
    SET payment_total = payment_total - OLD.amount
    WHERE invoice_id = OLD.invoice_id;
    
    INSERT INTO payments_audit
    VALUES (OLD.client_id, OLD.date, OLD.amount, 'Delete', NOW()); -- now we are deleting and replacing new keyword with old keyword
END$$
DELIMITER ;

INSERT INTO payments
VALUES (DEFAULT, 5, 3, '2019-01-01', 10, 1);

DELETE
FROM payments
WHERE payment_id = 10;

-- see the payment audit table for updates