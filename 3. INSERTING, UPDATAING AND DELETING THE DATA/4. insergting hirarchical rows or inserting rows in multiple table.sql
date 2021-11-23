-- inserting hirarchical rows

-- previously we learned how to enter data into the single row , now we gonna learn how to insert the data in multiple rows

-- observe the orders table, what cols do we have hare, we have order id , customer_id, etc but what items are ordered are not in this table
-- we have in order_items table
-- an order can have more than one items, this is called a parent child relationship 
-- in this relationship we have orders table as parent and order_items table as child
-- one row in the orders table can have one or more childrens in order_items table

-- in this tutorial we gonna learn how to insert the orders and all its items/ we will learn how to insert data into multiple tables

INSERT INTO orders(customer_id,
order_date,
status)
VALUES (1, '2019-01-02', 1);
-- IN order_items table we have order_id col and it is AI and it will also add different order id
-- we have bult in function 'LAST_INSERT_ID()' function to avoid that
INSERT INTO order_items -- we have 4 cols and all are required to insert values so we are not going to specify cols here just insert the values
VALUES (LAST_INSERT_ID(), 1, 1, 2.5), -- PRODUCT_ID, QUANTITY, UNIT_PRICE
       (LAST_INSERT_ID(), 2, 1, 3); -- ANOTHER PRODUCT ADDED TO THE ORDER
       
-- now we gonna have 1 record added to orders table and 2 records for order_items table as we've inserted two items for one order