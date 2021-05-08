--g. create / drop a table.

USE clothes_company_DB

--GO
--ALTER PROCEDURE spCreateTable_test_table
--AS
--BEGIN
--	CREATE TABLE test_table
--	(
--		fake_index int NOT NULL,
--		fake_name varchar(5),
--		fake_country varchar(7),
--		fake_CNP int
--	)
--END

--GO
--ALTER PROCEDURE spDropTable_test_table
--AS
--BEGIN
--	DROP TABLE test_table
--END

EXECUTE spDropTable_test_table;
EXECUTE spCreateTable_test_table;