--a. modify the type of a column;

USE clothes_company_DB

GO
ALTER PROCEDURE spModifyColumnTypeClients
AS
BEGIN
	ALTER TABLE clients
	ALTER COLUMN age varchar(2)
END

GO
ALTER PROCEDURE spReverseColumnTypeClients
AS
BEGIN
	ALTER TABLE clients
	ALTER COLUMN age int
END

EXECUTE spModifyColumnTypeClients;
EXECUTE spReverseColumnTypeClients;
