--e. add / remove a candidate key;

USE clothes_company_DB

GO
ALTER PROCEDURE spAddCK_test_table
AS
BEGIN
	ALTER TABLE test_table
	ADD CONSTRAINT unique_FN_FC UNIQUE(fake_name, fake_country)
END;


GO
ALTER PROCEDURE spRemoveCKtest_table
AS
BEGIN
	ALTER TABLE test_table
	DROP CONSTRAINT unique_FN_FC
END;