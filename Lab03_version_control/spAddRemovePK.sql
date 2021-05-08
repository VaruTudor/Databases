--d. add / remove a primary key;

USE clothes_company_DB

GO
ALTER PROCEDURE spRemovePK_test_table
AS
BEGIN
	ALTER TABLE test_table
	DROP CONSTRAINT PK_test
END

GO
ALTER PROCEDURE spAddPK_test_table
AS
BEGIN
	ALTER TABLE test_table
	ADD CONSTRAINT PK_test PRIMARY KEY (fake_index)
END

EXECUTE spAddPK_test_table;
EXECUTE spRemovePK_test_table;