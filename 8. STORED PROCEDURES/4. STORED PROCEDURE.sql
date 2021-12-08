-- DROPPING PROCEDURES

DROP PROCEDURE get_clients;

-- our procedure is gone and is not visible in the mysql workbench penal

-- if we execute the above code one more time it will throw an error
-- because mysql will throws an error when we drop the procedure which does not exists.
-- to avoid this we shall use following statement

DROP PROCEDURE IF EXISTS get_clients;


-- just like saving the source code of views in github
-- it is good practice to store the source code of stored procedure to github