USE clothes_company_DB
GO
CREATE OR ALTER PROCEDURE sp_test_runs
	@test_to_run int
AS
BEGIN
	INSERT INTO TestRuns select NULL, NULL, NULL;
	DECLARE @test_run_id int;
	SELECT @test_run_id = MAX(TestRunID)
	FROM TestRuns

	DECLARE @description varchar(200);
	SET @description = 'TEST ' + CAST(@test_to_run as varchar);

	DECLARE @start_date datetime;
	SET @start_date = CURRENT_TIMESTAMP;

	DECLARE @current_table_id int;
	DECLARE @current_view_id int;
	DECLARE @current_table_name varchar(200);
	DECLARE @current_view_name varchar(200);

	DECLARE @min_position int;
	SELECT @min_position = MIN(Position)
	 FROM (SELECT *
			FROM TestTables
			WHERE TestID = @test_to_run ) as t;

	DECLARE @max_position int;
	SELECT @max_position = MAX(Position)
	 FROM (SELECT *
			FROM TestTables
			WHERE TestID = @test_to_run ) as t;

	DECLARE @current_position int;
	SET @current_position = @min_position;

	DECLARE @table_start datetime;
	DECLARE @table_end datetime;
	WHILE @current_position <= @max_position
	BEGIN
		-- loop and delete all data in position order
		
		SELECT @current_table_id = TableID
		FROM TestTables
		WHERE Position = @current_position AND  TestID = @test_to_run;

		SELECT @current_table_name = Name
		FROM Tables
		WHERE TableID = @current_table_id;

		
		EXECUTE ('DELETE FROM ' + @current_table_name);
		SET @current_position = @current_position + 1;

		
	END;

	SET @current_position = @max_position;	
	WHILE @current_position >= @min_position 
	BEGIN
		-- loop and insert all data in position order
		SELECT @current_table_id = TableID
		FROM TestTables
		WHERE Position = @current_position AND  TestID = @test_to_run;

		SELECT @current_table_name = Name
		FROM Tables
		WHERE TableID = @current_table_id;

		DECLARE @rows_to_insert int;
		SELECT @rows_to_insert =  NoOfRows
		FROM TestTables
		WHERE Position = @current_position AND  TestID = @test_to_run;

		SET @table_start = GETDATE();
		EXECUTE ('EXECUTE sp_insert_into_table @nr_rows =' +  @rows_to_insert + ', @table_name =' + @current_table_name);
		SET @table_end = GETDATE();
		SET @current_position = @current_position - 1;
		SET @description = @description + ' | tb ' + @current_table_name + ', rows ' + CAST(@rows_to_insert as varchar) + ' |';

		INSERT INTO TestRunTables select @test_run_id, @current_table_id, @table_start, @table_end;
	END;

	-- we use this for the first view in the current table
	DECLARE @first_view int;
	SELECT @first_view = MIN(ViewID)
	 FROM (SELECT *
			FROM TestViews
			WHERE TestID = @test_to_run ) as t;

	-- we use this for the last view in the current table
	DECLARE @last_view int;
	SELECT @last_view = MAX(ViewID)
	 FROM (SELECT *
			FROM TestViews
			WHERE TestID = @test_to_run ) as t;

	DECLARE @current_view int;
	SET @current_view = @first_view
	DECLARE @view_start datetime;
	DECLARE @view_end datetime;
	WHILE @current_view <= @last_view
	BEGIN
		-- loop and do a select for each view
		
		IF @current_view IN (SELECT ViewID
								FROM TestViews
								WHERE TestID = @test_to_run)
		BEGIN
			-- if there is a view with ViewID as current_position
			SET @view_start = GETDATE()

			SELECT @current_view_id = ViewID
			FROM TestViews
			WHERE ViewID = @current_view AND  TestID = @test_to_run

			SELECT @current_view_name = Name
			FROM Views
			WHERE ViewID = @current_view_id

			EXECUTE ('SELECT * FROM ' + @current_view_name)
			SET @view_end = GETDATE()

			INSERT INTO TestRunViews select @test_run_id, @current_view_id, @view_start, @view_end
		END
		SET @current_view = @current_view + 1;
	END;

	-- after everything else is done we update TestRuns
	DECLARE @end_date datetime;
	SET @end_date = CURRENT_TIMESTAMP;
	
	UPDATE TestRuns
	SET Description = @description, StartAt = @start_date, EndAt = @end_date
	WHERE TestRunID = @test_run_id;

END
GO
