/*
populate tables
*/




insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Clothes Gene SA','C423 Ringarooma Tasmania',344);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Clothx SRL','44 Via Lardona, Cavinati, Veneto',20);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Clothworks SA','D805 Yozgat',78);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('CLTH','D8TY',89);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('NT SA','TR3UI',15);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('New one','TR3UI',17);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Older one','TR3UI',13);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Oldest one','TR3UI',44);
insert into dbo.production_factories
(factory_name,factory_location,nr_employees)
	values	('Actually the oldest one','TR3UI',48);




insert into product
(product_name,price)
values('Blue Jeans Slim Fit',45);
insert into product
(product_name,price)
values('Simple White T-Shirt',15);
insert into product
(product_name,price)
values('Winter Camo Jacket',155);
insert into product
(product_name,price)
values('Green Simple Cap',90);
insert into product
(product_name,price)
values('Black Dress',200);
insert into product
(product_name,price)
values('White Dress',185);




insert into clients 
(age,first_name,last_name)
values(20,'Brad','Goff');
insert into clients 
(age,first_name,last_name)
values(44,'Brad','Pitt');
insert into clients 
(age,first_name,last_name)
values(35,'Brad','Stevens');
insert into clients 
(age,first_name,last_name)
values(23,'Jayde','Kline');
insert into clients 
(age,first_name,last_name)
values(28,'Elsa','Hal');
insert into clients 
(age,first_name,last_name)
values(33,'Elsa','Martins');
insert into clients 
(age,first_name,last_name)
values(36,'Mark','Steven');
insert into clients 
(age,first_name,last_name)
values(41,'Ely','Monk');
insert into clients 
(age,first_name,last_name)
values(33,'Ely','Martins');




insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 100, 2);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 106, 3);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504223, 103, 3);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504223, 103, 2);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504223, 106, 4);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 103, 6);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 103, 2);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 106, 2);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504366, 103, 4);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504223, 100, 6);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504080, 100, 6);
insert into orders
(order_date, customer_CNP, product_code, shop_id)
values (GETDATE(),504366, 103, 4);



insert into shop
(shop_name, supplier_id)
values('Shop 1',35);
insert into shop
(shop_name, supplier_id)
values('Main Shop',35);
insert into shop
(shop_name, supplier_id)
values('Shop 2',45);
insert into shop
(shop_name, supplier_id)
values('Shop 15',45);
insert into shop
(shop_name, supplier_id)
values('Shop 77',45);





insert into employee
(shop_id,first_name,last_name)
values(2,'Blue','John');
insert into employee
(shop_id,first_name,last_name)
values(3,'White','George');
insert into employee
(shop_id,first_name,last_name)
values(3,'Yellow','Anna');
insert into employee
(shop_id,first_name,last_name)
values(3,'Black','Mike');
insert into employee
(shop_id,first_name,last_name)
values(4,'Red','Mark');



insert into sponsor
(sponsor_name)
values('Nike');
insert into sponsor
(sponsor_name)
values('Maseratti');
insert into sponsor
(sponsor_name)
values('CityInsurance');
insert into sponsor
(sponsor_name)
values('New Balance');
insert into sponsor
(sponsor_name)
values('Noriel');


insert into sponsor_contract
(shop_sponsored_id,sponsor_id)
values(3,100);
insert into sponsor_contract
(shop_sponsored_id,sponsor_id)
values(4,100);
insert into sponsor_contract
(shop_sponsored_id,sponsor_id)
values(2,100);
insert into sponsor_contract
(shop_sponsored_id,sponsor_id)
values(3,110);
insert into sponsor_contract
(shop_sponsored_id,sponsor_id)
values(4,110);




insert into fashion_collection
(collection_name, production_factory_id)
values('Winter is coming', 35);
insert into fashion_collection
(collection_name, production_factory_id)
values('No more boredom', 45);
insert into fashion_collection
(collection_name, production_factory_id)
values('Drop it', 40);
insert into fashion_collection
(collection_name, production_factory_id)
values('Time for Fun', 35);
insert into fashion_collection
(collection_name, production_factory_id)
values('DKT', 35);



insert into collaborator
(collaborator_name,collection_of_collaboration)
values('John Snow','Winter is coming');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Post Malone','Winter is coming');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Cardi B','Drop it');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Eminem','Drop it');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Travis Scott','Drop it');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Ariana Grange','No more boredom');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Ed Sheeran','Time for fun');
insert into collaborator
(collaborator_name,collection_of_collaboration)
values('Bruno Mars','Time for fun');



/*
clear data
*/

delete from dbo.clients;
delete from dbo.collaborator;
delete from dbo.employee;
delete from dbo.fashion_collection;
delete from dbo.orders;
delete from dbo.product;
delete from dbo.production_factories;
delete from dbo.shop;
delete from dbo.sponsor;
delete from dbo.sponsor_contract;


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