/*On the relational structure created for the first lab, write SQL statements that:

You must use:

[DONE] arithmetic expressions in the SELECT clause in at least 3 queries;
[DONE] conditions with AND, OR, NOT, and parentheses in the WHERE clause in at least 3 queries;
[DONE] DISTINCT in at least 3 queries;
[DONE] ORDER BY in at least 2 queries;
[DONE] TOP in at least 2 queries;
[DONE] Your queries must be relevant to the problem domain.*/

/*insert data – for at least 4 tables; at least one statement should violate referential integrity constraints;*/
insert into clients
(age, first_name, last_name)
values
(15,'Anne','Stevens');
-- adds a client with age 15, first name 'Anne' and last name 'Stevens'

insert into product
(product_name, price)
values
('White Rick and Morty T-shirt',30);
-- adds a product with product name 'White Rick and Morty T-shirt' and price 30

insert into sponsor
(sponsor_name)
values
('Twitch');
-- adds a sponsor with the sponsor name 'Twitch'

insert into employee
(shop_id, first_name, last_name)
values
(2,'Rinna','Hal');
-- adds an employee with shop_id 2, first_name 'Rinna' and last_name 'Hal'

/*at least one statement should violate referential integrity constraints*/
insert into employee
(shop_id, first_name, last_name)
values
(155,'Mark','Wal');
-- attempts (but fails due to integrity constraints) to add an employee with shop_id 155 (which does not correspond to any shop), first_name 'Mark' and last_name 'Wal'


/*update data – for at least 3 tables;
use at least once: {AND, OR, NOT},  {<,<=,=,>,>=,<> }, IS [NOT] NULL, IN, BETWEEN, LIKE.*/
update employee
set first_name = 'Marian'
where shop_id = 3 AND NOT(CNP = 504080 OR CNP = 504509);
-- updates the first_name to 'Marian' for the employees who work at the shop with id 3 and have a CNP of 504080 or 504509

update clients
set first_name = 'Marian'
where ( (CNP > 504080 AND age <= 20) OR (age >= 18 AND CNP < 504509) ) AND first_name <> 'Marian'; 
-- updates the first_name to 'Marian' for the clients who don't have the first_name 'Marian' and have a CNP of 504080 and are younger than 21
-- or have a CNP of 504509 and are older than 18 (age bigger or equal to 18)

update production_factories
set nr_employees = 500
where (factory_name IS NOT NULL) AND (nr_employees IN (5,15,75,155) ) OR nr_employees = 499;
-- updates the nr_employees to 500 for the production factories which have a non null factory_name
-- and who have 5,15,75,155 or 499 emploryees

update clients
set first_name = 'Angel'
where (age BETWEEN 18 and 65) OR (first_name LIKE 'Mar'); 
-- updates the first_name to 'Angel' for the clients having an age between 18 and 65 and whose first_name is 'Mar'

/*delete data – for at least 2 tables.
use at least once: {AND, OR, NOT},  {<,<=,=,>,>=,<> }, IS [NOT] NULL, IN, BETWEEN, LIKE.*/
delete from employee
where first_name IN ('Mark','Andrew','Sarah','George');
-- deletes the employees who have the first_name 'Mark','Andrew','Sarah' or 'George'

delete from production_factories
where nr_employees BETWEEN 0 and 10;
-- deletes the production factories which have less then 11 employees

/*QUERIES YAY*/



/*a. 2 queries with the union operation; use UNION [ALL] and OR;*/
select * 
from orders
where oid BETWEEN 15 and 19
union all
select * 
from orders
where oid BETWEEN 17 and 22
-- all orders with id between 15 and 22

select * from orders
where oid BETWEEN 15 and 19
union
select * from orders
where oid BETWEEN 17 and 22
-- all (distinct) orders with id between 15 and 22 

select * from employee
where shop_id = 2 OR shop_id = 3
union 
select * from employee
where shop_id = 4 
-- all employees that work for shops with id 2 or 3 or 4

select TOP 1 * from orders
where oid = 22 OR oid = 16
order by orders.order_date
-- first order with id 16 or 22



/*b. 2 queries with the intersection operation; use INTERSECT and IN;*/
select * from clients
where age IN (18,19,20,21,22,23,24,25,26,27,28,29,30)
INTERSECT
select * from clients
where age IN (18,19,20,21,22,23,24,25);
-- all clients who are between 18-25 years old

select * from employee
where shop_id IN (2,3)
INTERSECT
select * from employee
where shop_id IN (3,4);
-- all empleyees who work for the shop with id 3



/*c. 2 queries with the difference operation; use EXCEPT and NOT IN;*/
select * from clients
where age NOT IN (19,20,21,22,23)
EXCEPT
select * from clients
where age IN (24,25,26,27);
-- shows all clients which don't have the age 19,20,21,22,23,24 or 25 and without the ones with ages in 24-27

select * from orders
where shop_id NOT IN (4)
EXCEPT
select * from orders
where customer_CNP NOT IN (504366, 504223);
-- shows all orders which are not from shop 4 and without the where the customer has a CNP of 504366 or 504223



/*d. 4 queries with INNER JOIN, LEFT JOIN, RIGHT JOIN, and FULL JOIN (one query per operator); one query will join at least 3 tables, 
while another one will join at least two many-to-many relationships;*/
select TOP 5 oid, product_code, shop_id, product_name
from orders inner join shop on shop.sidentifier = orders.shop_id inner join product on orders.product_code = product.code
order by product.price DESC;
-- first 5 (most expensive) orders orders (also showing the shop id)

select *
from fashion_collection left join collaborator on fashion_collection.collection_name = collaborator.collection_of_collaboration;
-- fashion_collection toghether with collaborators (if there are no collaborators, their fields will be set to NULL)

select oid, product_code, product_name, shop_id
from orders right join product on product.code = orders.product_code;
-- shows orders toghether with the product_name, but for products which have no orders, order fields will be set to NULL

select oid, product_code as pid, customer_CNP as CNP, first_name, last_name, product_name, shop_id, contract_id, sponsor_name
from orders full join clients on orders.customer_CNP = clients.CNP full join product on orders.product_code = product.code,
	 sponsor_contract full join sponsor on sponsor.sp_id = sponsor_contract.sponsor_id full join shop on shop.sidentifier = sponsor_contract.shop_sponsored_id
-- shows orders with extra information about the client, shop and shop contract




/*e. 2 queries with the IN operator and a subquery in the WHERE clause; in at least one case, the subquery should include a subquery in its own WHERE clause;*/
select oid, order_date, customer_CNP 
from orders 
where oid IN 
	(select oid
	from orders
	where product_code IN (103,100)
	);
-- shows oid, order_date and customer_CNP for all customers who have an oid in a table where only orders with a product code of 100 and 103 are shown

select pid, factory_name
from production_factories
where factory_location IN	
	(select factory_location
	from production_factories
	where factory_name IN 
		(select factory_name
		from production_factories
		where nr_employees < 100) );
-- shows pid and factory_name for all factories which have the location in a table where only locations which are found in a table of factory_names where
-- are shown only factories with max 99 employees



/*f. 2 queries with the EXISTS operator and a subquery in the WHERE clause;*/
select shop_name,  (500 - production_factories.nr_employees) as JobsLeft
from shop inner join production_factories on production_factories.pid = shop.supplier_id
where EXISTS
	(select shop_id, COUNT(*) as quantity
	from orders
	group by shop_id);
--if there are sales show how many job openigs are for each shop

select collection_name, 10-count(*) as CollaboratorsToFull
from collaborator inner join fashion_collection on fashion_collection.collection_name = collaborator.collection_of_collaboration
where EXISTS
	(select factory_name, COUNT(*) as NrCollections
	from fashion_collection inner join production_factories on fashion_collection.production_factory_id = production_factories.pid
	group by factory_name)
group by collection_name;
-- if there are collections show how many collaborators can be added to form a team of max(10)



/*g. 2 queries with a subquery in the FROM clause; */
select product_code, COUNT(*) AS quantity_per_product 
from 
	(select customer_CNP, product_code, shop_id
	from orders) as subquery
GROUP BY product_code;
-- shows how many items were bought per product (code)
-- also uses a table created by a subquery (subquery)

select DISTINCT first_name
from
	(select CNP, first_name, last_name
	from employee
	where shop_id IN (2,3) ) as employee_names
-- shows the name of the employees who work at shops (with id) 2 and 3
-- also uses a table created by a subquery (employee_names)



/*h. 4 queries with the GROUP BY clause, 3 of which also contain the HAVING clause; 2 of the latter will also have a subquery in the HAVING clause; use the aggregation operators: COUNT, SUM, AVG, MIN, MAX;*/
select first_name, last_name, count(*) as nr_orders
from clients inner join orders on orders.customer_CNP = clients.CNP
group by first_name, last_name
order by nr_orders 
-- shows all the clients who have bought and the ammount of orders they have

select product_name, COUNT(*) as quantity, sum(price) as total_price, avg(price) as price
from 
	(select oid, product_code, product_name, price, shop_id
	from orders inner join product on product.code = orders.product_code) as ordest_of_products
group by product_name
order by total_price desc;
-- shows all the products that have been bought and how many (also the price of all sold stock)
-- also avg was used here to show the price as it is equal to all products

select first_name, min(age) as minimum_age, max(age) as maximum_age, count(age)
from clients
group by first_name
having max(age) >
	(select AVG(age)
	from clients);
-- shows the clients grouped by their first name and their minimum and maximum age as well as how many/name
-- also excludes the names for which the minimum age is not at least as the average age of all customers

select factory_location, sum(nr_employees) as total_employees, count(factory_name) as nr_factories
from production_factories
group by factory_location
having sum(nr_employees) >
	(select AVG(nr_employees)
	from production_factories);
-- shows the the number of employees on each location and how many total emplyees where there are more than the average (for all factories)
-- also shows how many factories are/ location



/*i. 4 queries using ANY and ALL to introduce a subquery in the WHERE clause (2 queries per operator); rewrite 2 of them with aggregation operators, and the other 2 with IN / [NOT] IN.*/
select *
from orders
where orders.shop_id = ANY
	(select shop_id
	from (select shop_id, COUNT(*) as quantity
		from orders
		group by shop_id) as quantity inner join shop on shop_id=shop.sidentifier
	where quantity > 2)
-- all orders which are from a shop with minimum 3 orders

select DISTINCT customer_CNP 
from orders
where orders.shop_id IN
	(select shop_id
	from (select shop_id, COUNT(*) as quantity
		from orders
		group by shop_id) as quantity inner join shop on shop_id=shop.sidentifier
	where quantity > 2);
-- rewritten with IN (also using DISTINCT to see just the CNPs) 


select first_name, last_name, (50-age) as YearsUntilAgePromotion 
from clients
where age >= ANY
	(select age 
	from clients
	where age > 25);
-- all clients who are at least min(=the youngest client older than 25)

select DISTINCT first_name
from clients
where age NOT IN
	(select age 
	from clients
	where age < 25);
-- rewritten with NOT IN (also using DISTINCT to see just the first names)

select *
from production_factories
where nr_employees > ALL
	(select count(*) as nr_employees
	from employee inner join shop on shop.sidentifier = employee.shop_id
	group by shop_id, shop_name);
-- all production factories which have more employees than all shops

select *
from production_factories
where nr_employees > 
	(select Max(N.nr_employees) as maxim
	from production_factories, 
		(select COUNT(*) as nr_employees
		from employee inner join shop on shop.sidentifier = employee.shop_id
		group by shop_id, shop_name) as N);
-- "the same but different" using MAX() 

select *
from clients
where age > ALL
	(select age
	from clients
	where age <= 
		(select AVG(age)
		from clients));
-- all clients with age bigger than average age

select *
	from clients
	where age > 
		(select AVG(age)
		from clients);
--rewritten with using (only) AVG

