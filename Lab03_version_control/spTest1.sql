CREATE TABLE test_table
(
	fName varchar(20),
	changeMe varchar(20),
);

USE clothes_company_DB
GO

CREATE PROCEDURE spModifyColumnType
AS
BEGIN
	ALTER TABLE test_table
	ALTER COLUMN changeMe int
END;

GO
CREATE PROCEDURE spReverseColumnType
AS
BEGIN
	ALTER TABLE test_table
	ALTER COLUMN changeMe varchar(20)
END

EXECUTE spModifyColumnType;
EXECUTE spReverseColumnType;