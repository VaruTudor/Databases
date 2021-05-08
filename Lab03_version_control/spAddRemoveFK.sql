--f. add / remove a foreign key;

USE clothes_company_DB

GO
ALTER PROCEDURE spRemoveFK_test_table
AS
BEGIN
	ALTER TABLE test_table
	DROP CONSTRAINT FK_test_table
END

GO
ALTER PROCEDURE spAddFK_test_table
AS
BEGIN
	ALTER TABLE test_table
	ADD CONSTRAINT FK_test_table FOREIGN KEY (fake_CNP) REFERENCES clients(CNP)
END
