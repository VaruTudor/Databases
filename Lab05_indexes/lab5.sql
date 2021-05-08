--Work on 3 tables
-- Ta(aid,a2,..)					-> clients(CNP,age,..)
-- Tb(bid,b2,..)					-> product(code,price,..)
-- Tc(cid,aid,bid,..)				-> orders(oid,customer_CNP,product_code)

-- aid,bid,cid,a2,b2 are int		-> CNP,code,oid,age,price are int
-- a2 is UNIQUE						-> age is unique
-- aid,bid are foreign keys in Tc	-> CNP,code are foreing keys in orders (referencing customer_CNP, respectively product_code)

select * from clients
select * from product
select * from orders

-- a. write queries on Ta (clients) having the following execution plans:
-- clustered index scan
SELECT CNP, first_name
FROM clients;

-- clustered index seek
SELECT *
FROM clients
WHERE CNP BETWEEN 504223 AND 504795;

-- nonclustered index scan
SELECT age
FROM clients

-- nonclustered index seek
SELECT age
FROM clients
WHERE age BETWEEN 23 AND 36

-- key lookup
SELECT *
FROM clients
WHERE age = 23; 


-- b. write query on Tb (products) with a where b2=value (price=15) and create nonclustered and show the execution plan before and after
-- before
SELECT price
FROM product
WHERE price = 15;

-- create nonclustered index
GO
CREATE NONCLUSTERED INDEX IX_Product_Price
	ON product (price);
GO

-- execute having the nonclustered index
SELECT price
FROM product
WHERE price = 15;

-- drop the index for future showcase
GO
DROP INDEX IX_Product_Price ON product
GO


-- c. create a view that joins 2 tabes. check index usage. (if not helpful) reassess existing indexes/examine the cardinality of the tables
SELECT price
FROM orders INNER JOIN product ON orders.product_code = product.code
WHERE price = 15

GO
CREATE NONCLUSTERED INDEX IX_Product
	ON product (price);
GO

SELECT price
FROM orders INNER JOIN product ON orders.product_code = product.code
WHERE price = 15

-- drop the index for future showcase
GO
DROP INDEX IX_Product ON product
GO



--INSERT INTO orders SELECT GETDATE(),504080,100,3
--INSERT INTO orders SELECT GETDATE(),504080,103,3
--INSERT INTO orders SELECT GETDATE(),504080,105,3
--INSERT INTO orders SELECT GETDATE(),504080,103,3
--INSERT INTO orders SELECT GETDATE(),504080,100,3
