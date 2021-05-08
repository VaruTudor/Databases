--SHOWING TABLES AND VIEWS WITH REQUIREMENT

--a table with a single-column primary key and no foreign keys;				(sponsor, PK sp_id)
SELECT * FROM sponsor

--a table with a single-column primary key and at least one foreign key;	(orders, PK oid, FK customer_CNP, FK product_code)
SELECT * FROM orders

--a table with a multicolumn primary key,									(sponsorship_organizations, PF (name,location), FK sp_id)
SELECT * FROM sponsorship_organizations


--a view with a SELECT statement operating on one table;
--CREATING THE VIEWS
--a view with a SELECT statement operating on one table
--USE clothes_company_DB
--GO
--CREATE VIEW orders_from_shop_2_and_3 AS
--SELECT *
--FROM orders
--WHERE shop_id IN (2,3);
--GO
INSERT INTO orders SELECT null, null, null, 2
INSERT INTO orders SELECT null, null, null, 2
INSERT INTO orders SELECT null, null, null, 3
INSERT INTO orders SELECT null, null, null, 4
select * from orders_from_shop_2_and_3


--a view with a SELECT statement operating on at least 2 tables;
--USE clothes_company_DB 
--GO
--CREATE VIEW collaborators_and_collections AS
--SELECT collaborator_name, collection_name, production_factory_id as pfid
--FROM collaborator LEFT JOIN fashion_collection ON collaborator.collection_of_collaboration = fashion_collection.collection_name
--GO
select * from collaborators_and_collections


--a view with a SELECT statement that has a GROUP BY clause and operates on at least 2 tables.
--USE clothes_company_DB
--GO
--CREATE VIEW shops_quantity_orders AS
--SELECT shop_name, COUNT(*) AS products_sold
--FROM orders INNER JOIN shop ON orders.shop_id = shop.sidentifier
--GROUP BY shop_name
--GO
select * from shops_quantity_orders
