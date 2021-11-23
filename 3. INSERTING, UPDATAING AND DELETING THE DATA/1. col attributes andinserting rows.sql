-- 1. column attributes

-- how to insert upadate and delete the data
-- pk means primary key
-- varchar means variable character,
-- NN means NOT NULL
-- AI means auto increament, it is mostly associated with PK, every time we insert value we allow sql to insert the values. eg if we have 10 records, mysql will add 11th col
-- phone and birthdate have default values NULL, if we do not insert values, it will automatically add nulls
-- similarly we have 0 as default value of points, if we do not supply any value, it will automatically add 0.

-- 2. inserting row
INSERT INTO customers
VALUES (DEFAULT,  -- FOR CUSTOMER ID WE HAVE AI CHECKED/ENABLED SO WE WILL PUT DEFAULT SO THAT SQL WILL ITSELF ADD VALUE TO IT
'John',  
'Smith', 
'1990-01-20',
NULL,  -- This is col for phone, we can put DEFAULT here so that sql will add null itself.
'H-105',
' Nashik', 
'MH',
DEFAULT); -- this is points col and default value sql will put is 0, we can add explicit value such as 200,300, etc.

-- we can insert the values for specific cols by specifying them in the querry

INSERT INTO customers (
first_name,  -- |
last_name,   -- | all the columns not necesarily need to be in the order, 
city,        -- | we can put any col name anywhere but they shall nbe in the sync with the values being inserted
state,       -- |
points,
address)
VALUES ('Tommy',
'Bhatt',
'Moscow',
'MH', 
200,
'H105');


