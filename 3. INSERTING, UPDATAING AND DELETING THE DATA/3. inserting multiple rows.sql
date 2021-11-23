-- inserting multiple rows
-- in this tutorial we gonna learn how to insert multiple rows in single go
-- we gonna use shippers table

INSERT INTO shippers (name)
VALUES ('shipper1'),
('shipper2'),  -- shipper id is AI and it will generate automatically so we do not have to insert the value
('shipper3');

-- exercise
-- insert the three rows in the products table name, quantity in stock, unit price

INSERT INTO products(name, quantity_in_stock, unit_price)
VALUES ('Zerzi belt', 5, 8.99),
('Bandana', 20, 3.5),
('Puma shoe', 10, 10);  -- we left the produc_id col because it is auto increamented(AI).