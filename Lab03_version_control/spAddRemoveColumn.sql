--b. add / remove a column;

USE clothes_company_DB

--GO
--CREATE PROCEDURE spAddExtraColumnClients
--AS
--BEGIN
--	ALTER TABLE clients
--	ADD new_dull_column int
--END

-- this does not work
GO
ALTER PROCEDURE spAddExtraColumn
	@Table varchar(25),
	@Column varchar(25)
AS
BEGIN
	ALTER TABLE [@Table]
	ADD [@Column] int
END

--GO
--CREATE PROCEDURE spRemoveExtraColumnClients
--AS
--BEGIN
--	ALTER TABLE clients
--	DROP COLUMN new_dull_column
--END


EXECUTE spAddExtraColumn
	@Table = 'clients', 
	@Column = 'blablabla';

EXECUTE spAddExtraColumnClients;
EXECUTE spRemoveExtraColumnClients;


