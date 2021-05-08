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




insert into clients 
(age,first_name,last_name)
values(20,'Brad','Goff');
insert into clients 
(age,first_name,last_name)
values(23,'Jayde','Kline');
insert into clients 
(age,first_name,last_name)
values(28,'Elsa','Hal');
insert into clients 
(age,first_name,last_name)
values(36,'Mark','Steven');
insert into clients 
(age,first_name,last_name)
values(41,'Ely','Monk');




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


