-- AN EVENT IS A TASK OR BLOCK OF SQL CODE THAT GETS EXECUTED ACCORDING TO A SCHEDULE
-- IT CAN GET EXECUTED ONCE OR ON REGULAR BASIS LIKE EVERYDAY AT 10 AM OR ONCE A MONTH, ETC 
-- IN EVENTS WE CAN AUTOMATE DATABASE MAINTAINANCE TASK SUCH AS DELETING STALE DATA, COPYING TABLE INTO AN ARCHIVED TABLE OFR AGGREGATE DATA TO GENERATE REPORTS 
-- BEFORE WE SCHEDULE AN EVENT WE NEED TO TURN ON MYSQL EVENTS SCHEDULER, IT IS BASICALLY A PROCESS THAT RUNS IN THE BACKGROUND 
    -- IT CONSTANTLY LOOKS FOR EVENTS TO EXECUTE
    -- IF WE EXECUTE FOLLOWING CODE 
SHOW VARIABLES LIKE 'event%';

-- we found event scheduler on by default
SET GLOBAL event_scheduler = ON;   -- to on the event_scheduler
SET GLOBAL event_scheduler = OFF;  -- to off the event_scheduler to save the system resources

-- we can create an event following way

DELIMITER $$
CREATE EVENT yearly_delete_stale_audit_rows -- it is good practice to name our events yearly, daily, fetc, or once if our events is gonna trigger for once
ON SCHEDULE -- IF WE WANT TO EXECUTE THE EVENT WE USE IN FOLLOWING WAY : 'AT '2019-01-01''
	-- AT '2019-01-01'
    EVERY 1 YEAR STARTS '2019-01-01' ENDS '2025-01-01' -- HERE WE CAN OPTIONALLY ADD THE START TIME AND WE CAN OPTIONALLY ADD ENDS TIME
DO BEGIN
	DELETE FROM payments_audit
    WHERE action_date < NOW() - INTERVAL 1 YEAR;
END$$
DELIMITER ;
