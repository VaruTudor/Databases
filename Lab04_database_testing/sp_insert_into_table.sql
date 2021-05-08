USE clothes_company_DB
GO
CREATE OR ALTER PROCEDURE sp_insert_into_table
	@nr_rows int,
	@table_name varchar(50)
AS
BEGIN
	DECLARE @i int;
	SET @i = 1;
	WHILE @i <= @nr_rows
	BEGIN
		EXECUTE ('INSERT INTO ' +  @table_name  + ' DEFAULT VALUES');
		SET @i = @i + 1;
	END
END
GO