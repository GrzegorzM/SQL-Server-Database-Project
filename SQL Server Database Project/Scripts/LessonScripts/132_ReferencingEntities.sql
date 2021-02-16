SELECT * FROM SYS.DM_SQL_REFERENCING_ENTITIES('dbo.tblEmployee', 'OBJECT');
SELECT * FROM SYS.DM_SQL_REFERENCED_ENTITIES('dbo.spGetEmployeesByGenderAndDepartment', 'OBJECT');

-- Schema-bound dependency prevents referenced objects from being dropped or modified as long as the referencing object exists.

CREATE TABLE tblEmployeeSchemaBindingTest
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50),
	Gender NVARCHAR(10)
);

CREATE VIEW vEmployeesNoSchemaBinding
AS
	SELECT * FROM tblEmployeeSchemaBindingTest;

SELECT * FROM vEmployeesNoSchemaBinding;
DROP TABLE tblEmployeeSchemaBindingTest; -- SUCCESS

CREATE TABLE tblEmployeeSchemaBindingTest
(
	Id INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50),
	Gender NVARCHAR(10)
);

CREATE VIEW vEmployeesWithSchemaBinding
WITH SCHEMABINDING
AS
	SELECT * FROM tblEmployeeSchemaBindingTest; -- ERROR - Syntax '*' is not allowed in schema-bound objects.

CREATE VIEW vEmployeesWithSchemaBinding
WITH SCHEMABINDING
AS
	SELECT [Id], [Name], [Gender] FROM tblEmployeeSchemaBindingTest; -- ERROR - A schema is missing before the table name.

CREATE VIEW vEmployeesWithSchemaBinding
WITH SCHEMABINDING
AS
	SELECT [Id], [Name], [Gender] FROM dbo.tblEmployeeSchemaBindingTest;

SELECT * FROM vEmployeesWithSchemaBinding;
DROP TABLE tblEmployeeSchemaBindingTest; -- ERROR - Cannot DROP TABLE 'tblEmployeeSchemaBindingTest' because it is being referenced by object 'vEmployeesWithSchemaBinding'.