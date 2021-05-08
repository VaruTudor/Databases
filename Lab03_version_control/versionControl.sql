
--CREATE TABLE current_state
--	(
--		current_version INT 
--	);


--CREATE TABLE switch_state
--	(
--		procedure_used varchar(50),
--		from_version int,
--		to_version int,
--		short_description varchar(100)
--	);

INSERT INTO current_state (current_version)
VALUES(0)
SELECT * FROM current_state;

--default DB								--> version 0

--a. modify the type of a column;			--> version 1
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spModifyColumnTypeClients',0,1,'modifies the type of column age(table clients) from int to varchar');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spReverseColumnTypeClients',1,0,'modifies the type of column age(table clients) from varchar back to int');

--b. add / remove a column;					--> version 2
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spAddExtraColumnClients',1,2,'adds column new_dull_column(int) to clients');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spRemoveExtraColumnClients',2,1,'removes column new_dull_column from clients');

--c. add / remove a DEFAULT constraint;		--> version 3
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spAddDefaultConstraintCollaborator',2,3,'sets a default constraint for collaborator_name to table collaborator');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spRemoveDefaultConstraintCollaborator',3,2,'removes the default constraint in table collaborator');

--g. create / drop a table.					--> version 4
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spCreateTable_test_table',3,4,'creates a new table called test_table');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spDropTable_test_table',4,3,'dropt the table test_table');

--d. add / remove a primary key;			--> version 5
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spAddPK_test_table',4,5,'adds fake_index as a primary key in table test_table');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spRemovePK_test_table',5,4,'removes fake_index as a primary key in table test_table');

--e. add / remove a candidate key;			--> version 6
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spAddCK_test_table',5,6,'adds fake_name and fake_country as a candidate key in table test_table');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spRemoveCKtest_table',6,5,'removes fake_name and fake_country as a candidate key in table test_table');

--f. add / remove a foreign key;			--> version 7
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spAddFK_test_table',6,7,'adds fake_age as a foreign key referencing age from clients in table test_table');
INSERT INTO switch_state (procedure_used, from_version, to_version, short_description)
VALUES('spRemoveFK_test_table',7,6,'removes foreign key from table test_table');

SELECT * FROM switch_state;



USE clothes_company_DB
GO
ALTER PROCEDURE spSwitchVersion
	@change_into_version int
AS
BEGIN
	WHILE (SELECT * FROM current_state) <> @change_into_version
		--we check if we want to go in a future version
		IF (@change_into_version NOT IN (0,1,2,3,4,5,6,7))
		BEGIN
			-- validate the parameter
			RAISERROR('Invalid parameter: @change_into_version is not from the list of stored procedures', 18, 0)
			RETURN
		END
		ELSE IF (@change_into_version > (SELECT * FROM current_state) )
		BEGIN
			DECLARE @print_value varchar(200);
			-- we check what procedure we need to execute need to go to the next version
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spModifyColumnTypeClients') 
			BEGIN
				--a. modify the type of a column;
				EXECUTE spModifyColumnTypeClients
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spModifyColumnTypeClients'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spAddExtraColumnClients') 
			BEGIN
				--b. add / remove a column;
				EXECUTE spAddExtraColumnClients
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spAddExtraColumnClients'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spAddDefaultConstraintCollaborator') 
			BEGIN
				--c. add / remove a DEFAULT constraint;
				EXECUTE spAddDefaultConstraintCollaborator
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spAddDefaultConstraintCollaborator'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spCreateTable_test_table') 
			BEGIN
				--g. create / drop a table.
				EXECUTE spCreateTable_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spCreateTable_test_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spAddPK_test_table') 
			BEGIN
				--d. add / remove a primary key;
				EXECUTE spAddPK_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spAddPK_test_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spAddCK_test_table') 
			BEGIN
				--e. add / remove a candidate key;
				EXECUTE spAddCK_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spAddCK_test_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT * FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) +1) = 'spAddFK_test_table') 
			BEGIN
				--f. add / remove a foreign key;
				EXECUTE spAddFK_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spAddFK_test_table'
				PRINT @print_value
			END
			UPDATE current_state
			SET current_version = current_version + 1
		END
		--or a previuos version
		ELSE IF(@change_into_version < (SELECT * FROM current_state) )
		BEGIN
			-- we check what procedure we need to execute to go to the previous version
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spReverseColumnTypeClients') 
			BEGIN
				--reverse a.
				EXECUTE spReverseColumnTypeClients
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spReverseColumnTypeClients'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spRemoveExtraColumnClients') 
			BEGIN
				--reverse b.
				EXECUTE spRemoveExtraColumnClients
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spRemoveExtraColumnClients'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spRemoveDefaultConstraintCollaborator') 
			BEGIN
				--reverse c.
				EXECUTE spRemoveDefaultConstraintCollaborator
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spRemoveDefaultConstraintCollaborator'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spDropTable_test_table') 
			BEGIN
				--reverse g.
				EXECUTE spDropTable_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spDropTable_test_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spRemovePK_test_table') 
			BEGIN
				--reverse d.
				EXECUTE spRemovePK_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spRemovePK_test_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spRemoveCKtest_table') 
			BEGIN
				--reverse e.
				EXECUTE spRemoveCKtest_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spRemoveCKtest_table'
				PRINT @print_value
			END
			IF ((SELECT procedure_used FROM switch_state WHERE switch_state.from_version = (SELECT *FROM current_state) AND switch_state.to_version = (SELECT * FROM current_state) -1) = 'spRemoveFK_test_table') 
			BEGIN
				--reverse f.
				EXECUTE spRemoveFK_test_table
				SELECT @print_value=short_description FROM switch_state WHERE  procedure_used = 'spRemoveFK_test_table'
				PRINT @print_value
			END
			UPDATE current_state
			SET current_version = current_version - 1
		END
END

EXECUTE spSwitchVersion @change_into_version = 0;
EXECUTE spSwitchVersion @change_into_version = 1;
EXECUTE spSwitchVersion @change_into_version = 2;
EXECUTE spSwitchVersion @change_into_version = 3;
EXECUTE spSwitchVersion @change_into_version = 4;
EXECUTE spSwitchVersion @change_into_version = 5;
EXECUTE spSwitchVersion @change_into_version = 6;
EXECUTE spSwitchVersion @change_into_version = 7;
EXECUTE spSwitchVersion @change_into_version = 8;


