-- inserts
--insert into Tables select 'sponsor'
--insert into Tables select 'orders'
--insert into Tables select 'sponsorship_organizations'

--insert into Views select 'orders_from_shop_2_and_3'
--insert into Views select 'collaborators_and_collections'
--insert into Views select 'shops_quantity_orders'

--insert into Tests select 'test__all_views'

--insert into TestTables select 1,1,2,1;
--insert into TestTables select 2,1,500,1;
--insert into TestTables select 3,1,10000,1;
--insert into TestTables select 5,1,10,1;
--insert into TestTables select 5,2,10,2;
--insert into TestTables select 5,3,10,3;
--insert into TestTables select 6,3,500000,1;

--insert into TestViews select 1,1;
--insert into TestViews select 7,1;
--insert into TestViews select 7,2;
--insert into TestViews select 7,3;

select * from sponsor;
select * from orders;
select * from sponsorship_organizations;

select * from Tests
select * from Tables
select * from TestTables
select * from TestViews
select * from Views
select * from TestRuns
select * from TestRunTables
select * from TestRunViews

EXECUTE sp_test_runs @test_to_run = 1;
EXECUTE sp_test_runs @test_to_run = 2;
EXECUTE sp_test_runs @test_to_run = 3;
EXECUTE sp_test_runs @test_to_run = 5;
EXECUTE sp_test_runs @test_to_run = 6;
EXECUTE sp_test_runs @test_to_run = 7;

DELETE FROM TestRuns;
DELETE FROM TestRunTables;
DELETE FROM TestRunViews;