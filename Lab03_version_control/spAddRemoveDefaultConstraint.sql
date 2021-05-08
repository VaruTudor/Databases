--c. add / remove a DEFAULT constraint;

USE clothes_company_DB

--GO
--CREATE PROCEDURE spAddDefaultConstraintCollaborator
--AS
--BEGIN
--	ALTER TABLE collaborator
--	ADD CONSTRAINT df_collaborator_name
--	DEFAULT 'Not Baptised' FOR collaborator_name;
--END

--GO
--CREATE PROCEDURE spRemoveDefaultConstraintCollaborator
--AS
--BEGIN
--	ALTER TABLE collaborator
--	DROP CONSTRAINT df_collaborator_name
--END

EXECUTE spAddDefaultConstraintCollaborator;
EXECUTE spRemoveDefaultConstraintCollaborator;