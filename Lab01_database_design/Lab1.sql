/*create table production_factories
(
	pid int Primary Key identity(35,5),
	factory_name varchar(50),
	factory_location varchar(50),
	nr_employees int
)*/

/*create table product
(
	code int Primary Key identity(100,3),
	product_name varchar(20),
	price int
)*/

select *
from product

/*create table clients
(
	CNP int Primary Key identity(504080,143),
	age int,
	first_name varchar(20),
	last_name varchar(20)
)*/

select *
from clients

/*create table orders
(
	oid int Primary Key identity(9,1),
	order_date datetime,
	customer_CNP int,
	product_code int
)*/


insert into orders
(order_date, customer_CNP, product_code)
values (GETDATE(),50408, 100);

delete orders
where oid=10


alter table orders
add shop_id varchar(20);

alter table orders
alter column shop_id int;

alter table orders
add foreign key (shop_id) references shop(sidentifier);

alter table orders
add foreign key (customer_CNP) references clients(CNP);

alter table orders
add foreign key (product_code) references product(code);



-- joins
select * 
from orders
inner join product on product.code = orders.product_code;

select o.order_date, c.*, p.*
from orders as o
inner join clients as c on o.customer_CNP = c.CNP
inner join product as p on p.code = o.product_code;

-- functions
select sum(product.price)
from product

-- group by
select c.first_name, sum(p.price) as total, AVG(p.price) as average
from orders as o
inner join clients as c on o.customer_CNP = c.CNP
inner join product as p on p.code = o.product_code
group by c.first_name;

-- shop Table creation

/*create table shop
(
	sidentifier int Primary Key identity(1,1),
	shop_name varchar(20),
	supplier_id int
)*/

alter table shop
add foreign key (supplier_id) references production_factories(pid);



/*create table employee
(
	CNP int Primary Key identity(504080,143),
	shop_id int,
	first_name varchar(20),
	last_name varchar(20)
)*/

alter table employee
add foreign key (shop_id) references shop(sidentifier);



/*create table sponsor
(
	sp_id int Primary Key identity(100,10),
	sponsor_name varchar(20)
)*/

/*create table sponsor_contract
(
	contract_id int Primary Key identity(1,1),
	shop_sponsored_id int,
	sponsor_id int
)*/

alter table sponsor_contract
add foreign key (shop_sponsored_id) references shop(sidentifier);

alter table sponsor_contract
add foreign key (sponsor_id) references sponsor(sp_id);






-- creating the fashion_collection and collaborator Tables

/*create table fashion_collection
(
	collection_name varchar(30) Primary Key
)*/

alter table fashion_collection
add production_factory_id int

alter table fashion_collection
add foreign key (production_factory_id) references production_factories(pid);

/*create table collaborator
(
	collaborator_id	int Primary Key identity(1,1),
	collaborator_name varchar(30),
	collection_of_collaboration varchar(30)
)*/

alter table collaborator
add foreign key (collection_of_collaboration) references fashion_collection(collection_name); 



/*
	"print"(see) data(and tables)
*/


select * from sponsor_contract;		--1
select * from sponsor;				--2
select * from shop;
select * from employee				--4
select * from production_factories;
select * from clients;				--6
select * from product;
select * from orders;				--8

select * from fashion_collection;				
select * from collaborator;			--10


/*
	1:n  production factories:shop (one production factories can supply multiple shops)
	1:n  shop:employee (one shop can have multiple employees)
	m:n  client:product (one client can buy different products and one product can be bought by multiple clients using the bridge relation orders ( relationship set(ER) ) )
	m:n  shop:sponsor  (one shop can have multiple sponsors and one sponsor can help multiple shops, the bridge relation used is sponsor_contract ( relationship set(ER) ) )
*/